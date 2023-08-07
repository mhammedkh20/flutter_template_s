class GeneralResponse<T> {
  bool? status;
  int? code;
  String? message;
  T? data;

  GeneralResponse({this.status, this.code, this.message, this.data});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
