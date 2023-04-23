import 'package:chat/models/userModel.dart';
import 'package:chat/repositories/userRepository.dart';
import 'package:mobx/mobx.dart';
part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  UserModel? currentUser;

  _UserStore() {
    UserRepository.getUserFromUserName("fernando_duwe").then((value) {
      currentUser = value;
    });
  }

  @computed
  String get currentUserName => (this.currentUser != null ? this.currentUser!.userName : "");

  @computed
  bool get existsUser => this.currentUser != null;

  @action
  Future<void> setUser(UserModel prUser) async {
    this.currentUser = prUser;

    print("setUser");

    await UserRepository.updateUser(prUser);
  }
}