import 'package:my_contact_book/app/models/user_model.dart';

enum CBLoginStatus {
  initial,
  loaded,
  loading,
  errors,
}

class CBLoginState {
  final CBLoginStatus status;
  final CBUserModel? user;
  final List<String>? errors;
  const CBLoginState({required this.status, this.user, this.errors});

  const CBLoginState.initial()
      : status = CBLoginStatus.initial,
        user = null,
        errors = null;

  CBLoginState copyWith(
      {CBLoginStatus? status, CBUserModel? user, List<String>? errors}) {
    return CBLoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      errors: errors ?? this.errors,
    );
  }
}
