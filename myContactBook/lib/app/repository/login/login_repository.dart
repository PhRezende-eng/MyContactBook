import 'package:my_contact_book/app/models/user_model.dart';

abstract class CBLoginRepository {
  Future<CBUserModel> createUser(String email, String password);
  Future<CBUserModel> loginUser(String email, String password);
}
