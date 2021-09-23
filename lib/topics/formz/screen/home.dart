import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:flutter_tutorial_v2/topics/formz/bloc/auth_bloc.dart';
import 'package:flutter_tutorial_v2/topics/formz/component/custom_text_field.dart';
import 'package:flutter_tutorial_v2/topics/formz/screen/logged_in.dart';
import 'package:formz/formz.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: DefaultLayout(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _Form(),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (prev, cur) {
            return prev.email.invalid != cur.email.invalid;
          },
          builder: (context, state) {
            return CustomTextField(
              label: '이메일',
              hintText: '이메일을 입력해주세요',
              errorText: state.email.invalid ? state.email.error : null,
              onChanged: (String val) {
                BlocProvider.of<AuthBloc>(context).add(
                  EmailChanged(
                    email: val,
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 16.0),
        BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (prev, cur) {
            return prev.password.invalid != cur.password.invalid;
          },
          builder: (context, state) {
            return CustomTextField(
              label: '비밀번호',
              hintText: '비밀번호를 입력해주세요',
              obscureText: true,
              errorText: state.password.invalid ? state.password.error : null,
              onChanged: (String val) {
                BlocProvider.of<AuthBloc>(context).add(
                  PasswordChanged(
                    password: val,
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(height: 32.0),
        BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (prev, cur) {
            return prev.status != cur.status;
          },
          listener: (context, state) {
            if (state.status == FormzStatus.submissionSuccess) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LoggedInScreen(),
                ),
              );
            }
          },
          buildWhen: (prev, cur) {
            return prev.status != cur.status;
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state.status == FormzStatus.submissionInProgress
                  ? null
                  : () {
                      BlocProvider.of<AuthBloc>(context).add(
                        Submitted(),
                      );
                    },
              child: Text(
                '로그인',
              ),
            );
          },
        ),
      ],
    );
  }
}
