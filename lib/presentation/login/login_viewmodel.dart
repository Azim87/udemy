import 'package:udemy/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel implements LoginViewModelInput{
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void login() {
    // TODO: implement login
  }

  @override
  void setPassword(String password) {
    // TODO: implement setPassword
  }

  @override
  void setUserName(String name) {
    // TODO: implement setUserName
  }
}

abstract class LoginViewModelInput {
  void setUserName(String name);
  void setPassword(String password);
  void login();
}