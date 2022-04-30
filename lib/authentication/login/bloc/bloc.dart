import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/authentication/login/bloc/events/events.dart';
import 'package:fluttertask/authentication/repository/user_repository.dart';

import 'states/states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;

  LoginBloc(UserRepository userRepository)
      :_userRepository = userRepository,
        super(LoginInitial()) {
    on<LogInWithEmailAndPassword>(_onLogInWithEmailAndPassword);
  }

  Future<void> _onLogInWithEmailAndPassword(
      LogInWithEmailAndPassword event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final user = await _userRepository.signInWithEmailAndPassword(
          event.email ?? "", event.password ?? "");
      if (user.token != null ) {
        emit(LoginSuccess(user: user));
      } else {
        emit(LoginFailure(error: 'Something went wrong'));
        emit(LoginInitial());
      }
    } catch (err) {
      emit(LoginFailure(error: err.toString()));
      emit(LoginInitial());
    }
  }
}
