import 'package:my_contact_book/app/models/user_model.dart';

enum CBLoginStatus {
  initial,
  loaded,
  loading,
}

class CBLoginState {
  final CBLoginStatus status;
  final CBUserModel? user;
  const CBLoginState({required this.status, this.user});

  const CBLoginState.initial()
      : status = CBLoginStatus.initial,
        user = null;

  CBLoginState copyWith({CBLoginStatus? status, CBUserModel? user}) {
    return CBLoginState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}
