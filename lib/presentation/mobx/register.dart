import 'dart:developer';

import 'package:fidooo_challenge/auth/auth.dart';
import 'package:mobx/mobx.dart';

part 'register.g.dart';

class Register = RegisterStore with _$Register;

abstract class RegisterStore with Store {
  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<bool> registerWithMail() async {
    loading = true;
    try {
      final authUser = await authManager.createAccountWithEmail(
        email,
        password,
      );

      if (authUser == null) throw Exception('User not found');

      loading = false;
      return true;
    } catch (e) {
      log('register error: $e');
      loading = false;
      return false;
    }
  }
}
