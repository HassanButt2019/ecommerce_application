

part of'states.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserModel? user;

  SignUpSuccess({required this.user});

  @override
  List<Object> get props => [user!];

}

class SignUpFailure extends SignUpState {
  final String? error;

  SignUpFailure({required this.error});
  @override
  List<Object> get props => [error!];
}
