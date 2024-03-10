import 'dart:io';



abstract class IApiProviderNew {
  Future<dynamic> getMethod<T>({
    required String endPoint,
    Map<String, dynamic>? query,
  });

  Future<dynamic> postMethod<T>({
    required String endPoint,
    required dynamic body,
    Map<String, File>? files,
    bool isFormData,
    bool isSetApiVersion,
    bool isTokenRequired,
  });
}
