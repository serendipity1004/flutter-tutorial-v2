import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial_v2/topics/formz/form/email.dart';
import 'package:flutter_tutorial_v2/topics/formz/form/password.dart';
import 'package:formz/formz.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          AuthState(
            email: EmailInput.pure(),
            password: PasswordInput.pure(),
          ),
        );

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield this._mapEmailChangedToState(event);
    } else if (event is PasswordChanged) {
      yield this._mapPasswordChangedToState(event);
    } else if (event is Submitted) {
      yield* this._mapSubmittedToState(event);
    }
  }

  AuthState _mapEmailChangedToState(EmailChanged event) {
    final email = EmailInput.dirty(event.email);

    return state.copyWith(
      email: email,
      status: Formz.validate([email]),
    );
  }

  AuthState _mapPasswordChangedToState(PasswordChanged event) {
    final password = PasswordInput.dirty(event.password);

    return state.copyWith(
      password: password,
      status: Formz.validate([password]),
    );
  }

  Stream<AuthState> _mapSubmittedToState(Submitted event) async* {
    final email = EmailInput.dirty(state.email.value);
    final password = PasswordInput.dirty(state.password.value);

    final status = Formz.validate([email, password]);

    yield state.copyWith(
      email: email,
      password: password,
      status: status,
    );

    if (status.isValidated) {
      // API 요청
      yield state.copyWith(
        status: FormzStatus.submissionInProgress,
      );

      await Future.delayed(Duration(seconds: 1));

      yield state.copyWith(
        status: FormzStatus.submissionSuccess,
      );
    }
  }
}
