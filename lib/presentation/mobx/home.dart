import 'package:core/core.dart';
import 'package:mobx/mobx.dart';

part 'home.g.dart';

final _contactsRepository = ContactsRepository();

/// Store for managing the home screen.
class Home = HomeStore with _$Home;

abstract class HomeStore with Store {
  @observable
  List<Contact> contacts = [];

  @action
  Future<void> getContacts() async {
    contacts = await _contactsRepository.getContacts();
  }
}
