import 'package:formz/formz.dart';

class EmailInput extends FormzInput<String, String> {
  EmailInput.pure() : super.pure('');

  EmailInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.length < 6) {
      return '6자 이상을 입력해주세요.';
    }

    return null;
  }
}
