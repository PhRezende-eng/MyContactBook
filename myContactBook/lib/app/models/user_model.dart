class CBUserModel {
  final String? id;
  final String email;
  final String password;
  final String accessToken;
  final String refreshToken;

  CBUserModel(
      this.id, this.email, this.password, this.accessToken, this.refreshToken);

  factory CBUserModel.fromJson(Map<String, dynamic> json) => CBUserModel(
        json['id'] ?? '',
        json['email'] ?? '',
        json['password'] ?? '',
        json['accessToken'] ?? '',
        json['refreshToken'] ?? '',
      );
}
