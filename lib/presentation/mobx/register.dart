import 'dart:developer';

import 'package:fidooo_challenge/auth/auth.dart';
import 'package:mobx/mobx.dart';

part 'register.g.dart';

class Register = RegisterStore with _$Register;

abstract class RegisterStore with Store {
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
    try {
      final authUser = await authManager.createAccountWithEmail(
        email,
        password,
      );

      if (authUser == null) throw Exception('User not found');

      return true;
    } catch (e) {
      log('register error: $e');
      return false;
    }
  }
}
