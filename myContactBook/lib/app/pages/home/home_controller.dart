import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:my_contact_book/app/core/config/api_excpetion.dart';
import 'package:my_contact_book/app/pages/home/home_state.dart';
import 'package:my_contact_book/app/repository/home/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CBHomeController extends Cubit<CBHomeState> {
  final CBHomeRepository _homeRepository;
  CBHomeController(this._homeRepository) : super(const CBHomeState.initial());

  Future<void> getUser() async {
    try {
      emit(state.copyWith(status: CBHomeStatus.loading));
      await Future.delayed(Duration(seconds: 2));
      final sp = await SharedPreferences.getInstance();
      final accessToken = sp.getString('accessToken');
      final userId = sp.getString('userId');

      if (accessToken != null && userId != null) {
        final user = await _homeRepository.getUser(userId, accessToken);
        emit(state.copyWith(user: user, status: CBHomeStatus.loading));
      } else {
        emit(state.copyWith(status: CBHomeStatus.errors, errors: [
          'Você não está logado, crie sua conta ou faça login para criar e ver sua lista de contato.'
        ]));
      }
    } on CBApiException catch (e, s) {
      const errorMessage = 'Erro ao buscar usuário';
      log(errorMessage, error: e, stackTrace: s);
      emit(state.copyWith(status: CBHomeStatus.errors, errors: e.messages));
      throw CBApiException(e.messages);
    }
  }
}
