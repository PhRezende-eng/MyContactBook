import 'package:dio/dio.dart';
import 'package:my_contact_book/app/core/client/rest_client.dart';
import 'package:my_contact_book/app/models/user_model.dart';
import 'package:my_contact_book/app/repository/login/login_repository.dart';

class CBLoginRepositoryImpl implements CBLoginRepository {
  CustomDio dio;
  CBLoginRepositoryImpl(this.dio);

  @override
  Future<CBUserModel> createUser(String email, String password) async {
    try {
      final response = await dio.post(
        "/login",
        data: {"email": email, "password": password},
      );
      final apiResponse = response.data;
      return CBUserModel.fromJson(apiResponse['data']);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
