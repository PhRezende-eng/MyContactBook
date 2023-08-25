import 'package:my_contact_book/app/models/user_model.dart';

enum CBHomeStatus {
  initial,
  loaded,
  loading,
  errors,
}

class CBHomeState {
  final CBHomeStatus status;
  final CBUserModel? user;
  final List<String>? errors;
  const CBHomeState({required this.status, this.user, this.errors});

  const CBHomeState.initial()
      : status = CBHomeStatus.initial,
        user = null,
        errors = null;

  CBHomeState copyWith(
      {CBHomeStatus? status, CBUserModel? user, List<String>? errors}) {
    return CBHomeState(
      status: status ?? this.status,
      user: user ?? this.user,
      errors: errors ?? this.errors,
    );
  }
}
