import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_class.freezed.dart';

@freezed
class Login with _$Login {
  factory Login({
    String? userName,
    String? password,
  }) = _Login;
}
