import 'package:dio/dio.dart';
import 'package:my_contact_book/app/core/client/rest_client.dart';
import 'package:my_contact_book/app/core/config/api_excpetion.dart';
import 'package:my_contact_book/app/models/user_model.dart';
import 'package:my_contact_book/app/repository/home/home_repository.dart';

class CBHomeRepositoryImpl implements CBHomeRepository {
  CustomDio dio;
  CBHomeRepositoryImpl(this.dio);

  @override
  Future<CBUserModel> getUser(String userId, String accessToken) async {
    try {
      final response = await dio.get(
        "/user/auth",
        queryParameters: {"userId": userId, "accessToken": accessToken},
      );

      final apiResponse = response.data;

      if (apiResponse['statusMessage'] == 'success') {
        return CBUserModel.fromJson(apiResponse['body']);
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
