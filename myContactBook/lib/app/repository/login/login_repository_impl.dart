import 'package:dio/dio.dart';
import 'package:my_contact_book/app/core/client/rest_client.dart';
import 'package:my_contact_book/app/core/config/api_excpetion.dart';
import 'package:my_contact_book/app/models/user_model.dart';
import 'package:my_contact_book/app/repository/login/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CBLoginRepositoryImpl implements CBLoginRepository {
  CustomDio dio;
  CBLoginRepositoryImpl(this.dio);

  @override
  Future<CBUserModel> createUser(String email, String password) async {
    try {
      final response = await dio.post(
        "/user/register",
        data: {"email": email, "password": password},
      );
      final apiResponse = response.data;

      if (apiResponse['statusMessage'] == 'success') {
        final sp = await SharedPreferences.getInstance();
        await sp.setString('accessToken', apiResponse['accessToken']);
        final user = CBUserModel.fromJson(apiResponse['body']);
        await sp.setString('userId', user.id ?? '');
        return user;
      } else {
        var errors = <String>[];
        for (var error in apiResponse['error']) {
          errors.add(error);
        }
        throw CBApiException(errors);
      }
    } on DioError catch (e) {
      throw CBApiException(
        e.response?.data['errors'] ?? ['Erro ao fazer a request'],
      );
    }
  }

  @override
  Future<CBUserModel> loginUser(String email, String password) async {
    try {
      final response = await dio.post(
        "/user/login",
        data: {"email": email, "password": password},
      );
      final apiResponse = response.data;

      if (apiResponse['statusMessage'] == 'success') {
        final sp = await SharedPreferences.getInstance();
        await sp.setString('accessToken', apiResponse['accessToken']);
        final user = CBUserModel.fromJson(apiResponse['body']);
        await sp.setString('userId', user.id ?? '');
        return user;
      } else {
        var errors = <String>[];
        for (var error in apiResponse['error']) {
          errors.add(error);
        }
        throw CBApiException(errors);
      }
    } on DioError catch (e) {
      throw CBApiException(
        e.response?.data['errors'] ?? ['Erro ao fazer a request'],
      );
    }
  }
}
