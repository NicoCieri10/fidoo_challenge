import 'package:mobx/mobx.dart';

part 'login.g.dart';

class Login = LoginStore with _$Login;

abstract class LoginStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void login() {}
}
