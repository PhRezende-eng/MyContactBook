import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_contact_book/app/core/config/api_excpetion.dart';
import 'package:my_contact_book/app/models/user_model.dart';
import 'package:my_contact_book/app/pages/home/home_state.dart';
import 'package:my_contact_book/app/repository/home/home_repository.dart';
import 'package:my_contact_book/app/service/user_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CBHomeController extends Cubit<CBHomeState> {
  final CBHomeRepository _homeRepository;
  final BuildContext _context;
  CBHomeController(this._homeRepository, this._context)
      : super(const CBHomeState.initial());

  void updateStateByUser(CBUserModel? user) {
    if (user != null && state.user != user) {
      emit(state.copyWith(user: user, status: CBHomeStatus.loaded, errors: []));
    }
  }

  Future<void> getUser() async {
    final userService = _context.read<CBUserService>();
    try {
      emit(state.copyWith(status: CBHomeStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      final sp = await SharedPreferences.getInstance();
      final accessToken = sp.getString('accessToken');
      final userId = sp.getString('userId');
      if (accessToken != null && userId != null) {
        final user = await _homeRepository.getUser(userId, accessToken);
        emit(state.copyWith(user: user, status: CBHomeStatus.loaded));
        userService.user = user;
      } else {
        userService.user = null;
        emit(state.copyWith(status: CBHomeStatus.errors, errors: [
          'Você não está logado, crie sua conta ou faça login para criar e ver sua lista de contato.'
        ]));
      }
    } on CBApiException catch (e, s) {
      const errorMessage = 'Erro ao buscar usuário';
      log(errorMessage, error: e, stackTrace: s);
      emit(state.copyWith(status: CBHomeStatus.errors, errors: e.messages));
      userService.user = null;
      // throw CBApiException(e.messages);
    }
  }
}
