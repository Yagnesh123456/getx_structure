import 'dart:convert';

import 'package:dartz/dartz.dart';


import '../../../data/network/core/api_endpoints.dart';
import '../../../data/network/core/api_provider.dart';
import '../../../data/network/core/base_response.dart';
import '../../../data/network/exceptions/custom_exceptions.dart';
import '../../../data/network/exceptions/failure.dart';
import '../model/login_response_dm.dart';
import 'i_login_repo.dart';

class LoginRepo extends ILoginRepo {
  @override
  Future<Either<Failure, List<LoginResponseDM>>> loginUserV2({
    required Map<String, dynamic> param,
  }) async {
    try {
      final response = await APIProvider().postMethod(
        endPoint: ApiEndpoints.loginV2,
        body: param,
      );
      BaseResponse<LoginResponseDM> loginUserV2 =
          BaseResponse<LoginResponseDM>.fromJson(
        jsonDecode(response.body),
        fromJson: LoginResponseDM.fromJson,
      );
      return Right(
        loginUserV2.data,
      );
    } catch (e, s) {
      if (e is CustomException) {
        return Left(
          Failure(
            errorMessage: e.message,
            errorCode: e.errorCode.toString(),
          ),
        );
      } else {
        return Left(
          Failure(
            errorMessage: 'Something Went Wrong',
            errorCode: '0',
            loggedErrorMessage: '${e.toString()} | ${s.toString()}',
          ),
        );
      }
    }
  }
}
