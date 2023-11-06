import 'package:core/core.dart';
import 'package:mobx/mobx.dart';

part 'home.g.dart';

final _contactsRepository = ContactsRepository();

/// Store for managing the home screen.
class Home = HomeStore with _$Home;

abstract class HomeStore with Store {
  @observable
  List<Contact> contacts = [];

  @observable
  bool loading = false;

  @action
  Future<void> getContacts() async {
    loading = true;
    contacts = await _contactsRepository.getContacts();
    loading = false;
  }
}
