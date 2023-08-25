import 'package:my_contact_book/app/models/user_model.dart';

abstract class CBHomeRepository {
  Future<CBUserModel> getUser(String userId, String accessToken);
}
