// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStore, Store {
  Computed<ChatEntitie>? _$getChatDataComputed;

  @override
  ChatEntitie get getChatData =>
      (_$getChatDataComputed ??= Computed<ChatEntitie>(() => super.getChatData,
              name: '_ChatStore.getChatData'))
          .value;

  late final _$idAtom = Atom(name: '_ChatStore.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$messageAtom = Atom(name: '_ChatStore.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$contactNameAtom =
      Atom(name: '_ChatStore.contactName', context: context);

  @override
  String get contactName {
    _$contactNameAtom.reportRead();
    return super.contactName;
  }

  @override
  set contactName(String value) {
    _$contactNameAtom.reportWrite(value, super.contactName, () {
      super.contactName = value;
    });
  }

  late final _$onlineAtom = Atom(name: '_ChatStore.online', context: context);

  @override
  bool get online {
    _$onlineAtom.reportRead();
    return super.online;
  }

  @override
  set online(bool value) {
    _$onlineAtom.reportWrite(value, super.online, () {
      super.online = value;
    });
  }

  late final _$avatarUrlAtom =
      Atom(name: '_ChatStore.avatarUrl', context: context);

  @override
  String get avatarUrl {
    _$avatarUrlAtom.reportRead();
    return super.avatarUrl;
  }

  @override
  set avatarUrl(String value) {
    _$avatarUrlAtom.reportWrite(value, super.avatarUrl, () {
      super.avatarUrl = value;
    });
  }

  late final _$_ChatStoreActionController =
      ActionController(name: '_ChatStore', context: context);

  @override
  void setMessage(String value) {
    final _$actionInfo =
        _$_ChatStoreActionController.startAction(name: '_ChatStore.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
message: ${message},
contactName: ${contactName},
online: ${online},
avatarUrl: ${avatarUrl},
getChatData: ${getChatData}
    ''';
  }
}
