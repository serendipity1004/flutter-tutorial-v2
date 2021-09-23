part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormzStatus status;

  AuthState({
    required this.email,
    required this.password,
    this.status = FormzStatus.pure,
  });

  AuthState copyWith({
    EmailInput? email,
    PasswordInput? password,
    FormzStatus? status,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        this.email,
        this.password,
        this.status,
      ];
}
