class LoginModel {
  bool? status;
  String? message;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  LoginModel(
      {this.status,
      this.message,
      this.accessToken,
      this.tokenType,
      this.expiresIn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
}