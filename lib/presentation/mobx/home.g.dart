// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Home on HomeStore, Store {
  late final _$contactsAtom =
      Atom(name: 'HomeStore.contacts', context: context);

  @override
  List<Contact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<Contact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$loadingAtom = Atom(name: 'HomeStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getContactsAsyncAction =
      AsyncAction('HomeStore.getContacts', context: context);

  @override
  Future<void> getContacts() {
    return _$getContactsAsyncAction.run(() => super.getContacts());
  }

  @override
  String toString() {
    return '''
contacts: ${contacts},
loading: ${loading}
    ''';
  }
}
