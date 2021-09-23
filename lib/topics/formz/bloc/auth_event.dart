part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class EmailChanged extends AuthEvent {
  final String email;

  EmailChanged({
    required this.email,
  });

  @override
  List<Object> get props => [this.email];
}

class PasswordChanged extends AuthEvent {
  final String password;

  PasswordChanged({
    required this.password,
  });

  @override
  List<Object> get props => [this.password];
}

class Submitted extends AuthEvent {
  @override
  List<Object> get props => [];
}
