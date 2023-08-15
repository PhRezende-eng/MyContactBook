import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_contact_book/app/pages/login/login_state.dart';
import 'package:my_contact_book/app/repository/login/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CBLoginController extends Cubit<CBLoginState> {
  final CBLoginRepository _loginRepository;
  CBLoginController(this._loginRepository)
      : super(const CBLoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> createUser(String email, String password) async {
    try {
      emit(state.copyWith(status: CBLoginStatus.loading));
      final user = await _loginRepository.createUser(email, password);
      // final sp = await SharedPreferences.getInstance();
      // sp.setString('accessToken', user.accessToken);
      // sp.setString('refreshToken', user.refreshToken);
      emit(state.copyWith(status: CBLoginStatus.loaded, user: user));
    } catch (e, s) {
      const errorMessage = 'Erro ao cadastrar usuário';
      log(errorMessage, error: e, stackTrace: s);
    }
  }

  void onPressedCreateUser(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      final navigator = Navigator.of(context);
      await createUser(emailController.text, passController.text);
      navigator.pop();
    }
  }
}
