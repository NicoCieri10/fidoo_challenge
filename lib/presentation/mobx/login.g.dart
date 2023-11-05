// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Login on LoginStore, Store {
  late final _$emailAtom = Atom(name: 'LoginStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$LoginStoreActionController =
      ActionController(name: 'LoginStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$LoginStoreActionController.startAction(name: 'LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginStoreActionController.startAction(
        name: 'LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo =
        _$LoginStoreActionController.startAction(name: 'LoginStore.login');
    try {
      return super.login();
    } finally {
      _$LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password}
    ''';
  }
}
