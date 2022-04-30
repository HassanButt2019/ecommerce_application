part of 'events.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInWithEmailAndPassword extends LoginEvent {
  final String? email;
  final String? password;

  LogInWithEmailAndPassword({required this.email, required this.password});

  @override
  List<Object> get props => [email!, password!];
}
