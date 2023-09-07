import 'package:flutter/foundation.dart';
import 'package:my_contact_book/app/models/user_model.dart';

class CBUserService extends ChangeNotifier {
  CBUserModel? _user;
  CBUserService();

  CBUserModel? get user => _user;
  set user(CBUserModel? user) {
    _user = user;
    notifyListeners();
  }
}
