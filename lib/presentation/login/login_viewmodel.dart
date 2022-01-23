import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udemy/domain/usecase/login_usecase.dart';
import 'package:udemy/presentation/base/base_view_model.dart';
import 'package:udemy/presentation/common/freezed_class.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  var _login = Login();
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(
      email: _login.userName!,
      password: _login.password!,
    )))
        .fold((failure) {
      debugPrint(failure.message);
    }, (data) {
      debugPrint(data.customer?.name);
    });
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    _login = _login.copyWith.call(password: password);
  }

  @override
  void setUserName(String name) {
    inputUserName.add(name);
    _login = _login.copyWith.call(userName: name);
  }

  @override
  Sink get inputPassword => _passwordController.sink;

  @override
  Sink get inputUserName => _userNameController.sink;

  @override
  Stream<bool> get outputIsPasswordIsValid =>
      _passwordController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameIsValid =>
      _userNameController.stream.map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password) => password.isNotEmpty;

  bool _isUserNameValid(String userName) => userName.isNotEmpty;
}

abstract class LoginViewModelInput {
  void setUserName(String name);

  void setPassword(String password);

  void login();

  Sink get inputUserName;

  Sink get inputPassword;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUserNameIsValid;

  Stream<bool> get outputIsPasswordIsValid;
}
