import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constant/common_method.dart';


import '../../local/storage_manager.dart';
import '../client/connectivity_client.dart';
import '../exceptions/custom_exceptions.dart';

import '../interfaces/i_api_provider_new.dart';
import 'api_endpoints.dart';
import 'base_response.dart';

class APIProvider implements IApiProviderNew {
  static APIProvider? _instance;

  static APIProvider get instance => _instance ?? APIProvider();

  var baseUrl = "";
  Duration timeout = Duration(
    seconds: 60,
  );

  @override
  Future<http.Response> getMethod<T>({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    http.Response responseJson;
    Uri url = Uri.https(
      baseUrl,
      '$endPoint',
      query,
    );

    try {
      if (await ConnectivityClient().checkInternet()) {
        String token = StorageManager.getString(
          StorageManager.prefAuthToken,
        );

        bool requestToken = DateTime.now().millisecondsSinceEpoch >
            (StorageManager.getInt(
                  StorageManager.prefTokenExpireTime,
                ) +
                10800000);
        log('Calling URL: $url');
        var result = await http.get(
          url,
          headers: {
            // 'Accept': acceptJson,
            // 'Content-Type': acceptJson,
            // 'Env': env,
            // 'ClientIP': AppClass().getClientIpAddress(),
            if (token.isNotEmpty) ...{
              'Authorization': 'Bearer $token',
            },
            if (requestToken) ...{
              'fr-rf-tk': '1',
            },
          },
        ).timeout(timeout);
        log('URL: $url | Response: ${result.body}');
        log('URL: $url | Request: $query');
        responseJson = returnResponse(
          result,
          errorLog: 'URL: $url | Request: $query | Response: ${result.body}',
        );
        BaseResponse baseResponse =
            BaseResponse<T>.fromJson(jsonDecode(responseJson.body))
              ..statusCode = result.statusCode;

        if (baseResponse.token != null) {
          if (baseResponse.token!.isNotEmpty) {
            debugPrint('Token saved-------- $token');
            StorageManager.setString(
                StorageManager.prefAuthToken, baseResponse.token ?? '');

            StorageManager.setInt(StorageManager.prefTokenExpireTime,
                DateTime.now().millisecondsSinceEpoch);
          }
        }
      } else {
        CommonMethods.apiFailureDialog();
        throw NoInternetException(
          message: 'No Internet Available',
          errorCode: 0,
        );
      }
    } on SocketException catch (e, s) {
      print('URL SOCKET EX: $url ');
      print('Socket Exception Error: $e | StackTrace: $s');
      CommonMethods.apiFailureDialog();
      throw NoInternetException(
        message: 'No Internet Available',
        errorCode: 0,
      );
    } on TimeoutException catch (e, s) {
      print('TIMEOUT EXCEPTION OCCURED: $url');
      print('Timeout Exception Error: $e | StackTrace: $s');
      CommonMethods.apiFailureDialog(
        isServerDown: true,
        errorLog: 'URL: $url | Request: $query',
      );
      throw CustomTimeoutException(
        message: 'Server Timeout',
        errorCode: 0,
      );
    }
    return responseJson;
  }

  @override
  Future<http.Response> postMethod<T>({
    required String endPoint,
    required body,
    Map<String, File>? files,
    bool isFormData = false,
    bool isSetApiVersion = false,
    bool isTokenRequired = true,
  }) async {
    http.Response responseJson;
    Uri url = Uri.https(
      baseUrl,
      '$endPoint',
    );

    try {
      if (await ConnectivityClient().checkInternet()) {
        final form = FormData(
          {...body},
        );

        if (files != null) {
          files.forEach(
            (key, value) {
              String fileName = value.path.split('/').last;
              form.files.add(
                MapEntry(
                  key,
                  MultipartFile(
                    value,
                    filename: fileName,
                  ),
                ),
              );
            },
          );
        }
        String token = StorageManager.getString(
          StorageManager.prefAuthToken,
        );

        log('Calling URL: $url');

        var result = await http
            .post(
              url,
              headers: {
                // 'Accept': acceptJson,
                // 'Content-Type': acceptJson,
                // 'Env': env,
                //
                // //in old implementation with V2 static value passed
                // 'Version': 'V2',
                // 'ClientIP': AppClass().getClientIpAddress(),
                // if (token.isNotEmpty && isTokenRequired) ...{
                //   'Authorization': 'Bearer $token',
                // },
                // if (isSetApiVersion) ...{
                //   'Version': apiVersion,
                // },
                // if (requestToken) ...{
                //   'fr-rf-tk': '1',
                // },
                // 'DeviceType': deviceType
              },
              body: isFormData ? form : jsonEncode(body),
              // contentType: acceptJson,
            )
            .timeout(timeout);
        log('URL: $url | Response: ${result.body}');
        log('URL: $url | Request: $body');
        responseJson = returnResponse(
          result,
          errorLog: 'URL: $url | Request: $body | Response: ${result.body}',
        );
        BaseResponse baseResponse =
            BaseResponse<T>.fromJson(jsonDecode(responseJson.body))
              ..statusCode = result.statusCode;
        if (baseResponse.token != null) {
          if (baseResponse.token!.isNotEmpty) {
            debugPrint('Token saved------ $token');
            StorageManager.setString(
                StorageManager.prefAuthToken, baseResponse.token ?? '');
            StorageManager.setInt(StorageManager.prefTokenExpireTime,
                DateTime.now().millisecondsSinceEpoch);
          }
        }
      } else {
        CommonMethods.apiFailureDialog();
        throw NoInternetException(
          message: 'No Internet Available',
          errorCode: 0,
        );
      }
    } on SocketException catch (e, s) {
      print('URL SOCKET EX: $url ');
      print('Socket Exception Error: $e | StackTrace: $s');
      CommonMethods.apiFailureDialog();
      throw NoInternetException(
        message: 'No Internet Available',
        errorCode: 0,
      );
    } on TimeoutException catch (e, s) {
      print('TIMEOUT EXCEPTION OCCURED: $url');
      print('Timeout Exception Error: $e | StackTrace: $s');
      CommonMethods.apiFailureDialog(
        isServerDown: true,
        errorLog: 'URL: $url | Request: $body',
      );
      throw CustomTimeoutException(
        message: 'Server Timeout',
        errorCode: 0,
      );
    }
    return responseJson;
  }

  //METHODS
  http.Response returnResponse(
    http.Response response, {
    String errorLog = 'Error',
  }) {
    print(
      'THIS IS THE STATUS CODE: ${response.statusCode}',
    );
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        CommonMethods.apiFailureDialog(
          isServerDown: true,
          errorLog: errorLog,
        );
        throw BadRequestException(
          message: 'Bad Request Exception',
          errorCode: response.statusCode,
        );
      case 401:
        CommonMethods.apiFailureDialog(
          isServerDown: true,
          errorLog: errorLog,
        );
        throw UnauthorizedException(
          message: 'UnauthorizedException',
          errorCode: response.statusCode,
        );
      case 403:
        CommonMethods.apiFailureDialog(
          isServerDown: true,
          errorLog: errorLog,
        );
        throw ForbiddenException(
          message: 'Forbidden Exception',
          errorCode: response.statusCode,
        );
      case 404:
        CommonMethods.apiFailureDialog(
          isServerDown: true,
          errorLog: errorLog,
        );
        throw NotFoundException(
          message: 'Not Found Exception',
          errorCode: response.statusCode,
        );
      case 500:
        CommonMethods.apiFailureDialog(
          isServerDown: true,
          errorLog: errorLog,
        );
        throw ServerDownException(
          message: 'Server Down Exception',
          errorCode: response.statusCode,
        );
      default:
        CommonMethods.apiFailureDialog(
          isServerDown: true,
          errorLog: errorLog,
        );
        throw UnknownException(
          message: 'DEFAULT ERROR MESSAGE',
          errorCode: response.statusCode,
        );
    }
  }
}
