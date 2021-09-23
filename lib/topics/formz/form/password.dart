import 'package:formz/formz.dart';

class PasswordInput extends FormzInput<String, String> {
  PasswordInput.pure() : super.pure('');

  PasswordInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.length < 6) {
      return '6자이상을 입력해주세요.';
    }

    return null;
  }
}
