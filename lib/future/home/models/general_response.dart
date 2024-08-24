class GeneralResponse<T> {
  bool? status;
  int? code;
  String? message;
  T? data;

  GeneralResponse({this.status, this.code, this.message, this.data});

  GeneralResponse.fromJson(
    dynamic json,
    T? Function(dynamic json) fromJson,
  ) {
    data = fromJson(json);
  }
}
