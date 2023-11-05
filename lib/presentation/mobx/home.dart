import 'package:fidooo_challenge/data/repository/repository.dart';
import 'package:fidooo_challenge/domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'home.g.dart';

final _chatRepository = ChatRepository();

/// Store for managing the home screen.
class Home = HomeStore with _$Home;

abstract class HomeStore with Store {
  @observable
  List<Contact> contacts = [];

  @action
  void getContacts() {
    contacts = _chatRepository.getContacts();
  }
}
