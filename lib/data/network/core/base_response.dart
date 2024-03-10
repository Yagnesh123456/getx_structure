class BaseResponse<T> {
  dynamic data;
  String? message;
  String? token;
  int? statusCode;

  BaseResponse({
    this.data,
    this.message,
    this.token,
    this.statusCode,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json, {
    Function? fromJson,
  }) =>
      BaseResponse<T>().parseJson(
        json: json,
        fromJson: fromJson,
      );

  parseJson({
    required Map<String, dynamic> json,
    fromJson,
  }) {
    this.message = json['message'];
    this.token = json['token'];
    this.statusCode = json['statusCode'];
    var jsonData = json['data'];
    if (jsonData != null) {
      if (jsonData is List) {
        if (fromJson == null) {
          this.data = jsonData;
        } else {
          this.data = List<T>.from(
            jsonData.map(
              (e) => fromJson(e),
            ),
          );
        }
      } else {
        if (fromJson == null) {
          this.data = jsonData;
        } else {
          this.data = fromJson(jsonData);
        }
      }
    }
    return this;
  }

  get dataModel {
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = this.message;
    data['token'] = this.token;
    if (data is List) {
      data['data'] = this
          .data
          ?.map(
            (e) => dataModel.toJson(),
          )
          .toList();
    }
    return data;
  }
}
