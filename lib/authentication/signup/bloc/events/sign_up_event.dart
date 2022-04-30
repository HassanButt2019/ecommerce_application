

part of'events.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPassword extends SignUpEvent {
  final String? email;
  final String? password;
  final String? name;

  SignUpWithEmailAndPassword({required this.email, required this.password , required this.name});

  @override
  List<Object> get props => [email!, password! , name!];
}
