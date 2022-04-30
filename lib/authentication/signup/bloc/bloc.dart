
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/authentication/repository/user_repository.dart';
import 'package:fluttertask/authentication/signup/bloc/events/events.dart';

import 'states/states.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc(UserRepository userRepository)
      :
        _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
  }

  Future<void> _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPassword event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final user = await _userRepository.signUpWithEmailAndPassword(
          email:event.email ?? "",password: event.password ?? "" ,name: event.name??"");
      if (user.token != null && user.name != null) {
        emit(SignUpSuccess(user: user));
      } else {
        emit(SignUpFailure(error: 'Something went wrong'));
        emit(SignUpInitial());
      }
    } catch (err) {
      emit(SignUpFailure(error: err.toString()));
      emit(SignUpInitial());
    }
  }
}
