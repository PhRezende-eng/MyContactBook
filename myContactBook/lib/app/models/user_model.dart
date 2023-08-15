class CBUserModel {
  final String email;
  final String password;
  final String accessToken;
  final String refreshToken;

  CBUserModel(this.email, this.password, this.accessToken, this.refreshToken);

  factory CBUserModel.fromJson(Map<String, dynamic> json) => CBUserModel(
        json['email'] ?? '',
        json['password'] ?? '',
        json['accessToken'] ?? '',
        json['refreshToken'] ?? '',
      );
}
