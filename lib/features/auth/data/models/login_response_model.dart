class LoginResponseModel {
  String? message;
  String? token;

  LoginResponseModel({this.message, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }
}
