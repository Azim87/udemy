import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udemy/domain/usecase/login_usecase.dart';
import 'package:udemy/presentation/base/base_view_model.dart';
import 'package:udemy/presentation/common/freezed_class.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final _userNameController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  final _inAllInputValidController = StreamController<void>.broadcast();

  var _login = Login();
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
    _inAllInputValidController.close();
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
    _validate();
  }

  @override
  void setUserName(String name) {
    inputUserName.add(name);
    _login = _login.copyWith.call(userName: name);
    _validate();
  }

  @override
  Sink get inputPassword => _passwordController.sink;

  @override
  Sink get inputUserName => _userNameController.sink;

  @override
  Sink get inputAllInput => _inAllInputValidController.sink;

  @override
  Stream<bool> get outputIsPasswordIsValid =>
      _passwordController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameIsValid =>
      _userNameController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _inAllInputValidController.stream.map((_) => _isAllInputsValid());

  bool _isPasswordValid(String password) => password.isNotEmpty;

  bool _isUserNameValid(String userName) => userName.isNotEmpty;

  bool _isAllInputsValid() =>
      _isUserNameValid(_login.userName ?? "") && _isPasswordValid(_login.password ?? "");

  _validate () {
    _inAllInputValidController.add(null);
  }

}

abstract class LoginViewModelInput {
  void setUserName(String name);

  void setPassword(String password);

  void login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputAllInput;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUserNameIsValid;

  Stream<bool> get outputIsPasswordIsValid;

  Stream<bool> get outputIsAllInputsValid;
}
