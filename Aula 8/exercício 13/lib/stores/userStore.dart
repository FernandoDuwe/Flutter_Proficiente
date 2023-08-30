import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:mobx/mobx.dart';

part 'userStore.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  UserModel? currentUser;

  @observable
  String docId = "";

  @computed
  String get userName => (currentUser == null ? "" : currentUser!.userName);

  @computed
  String get nickName => (currentUser == null ? "" : currentUser!.nickName);

  @computed
  String get avatarImage =>
      (currentUser == null ? "" : currentUser!.avatarImage);

  @action
  void setUserName(String value) {
    currentUser = UserModel(
        userName: value,
        nickName: this.nickName,
        avatarImage: this.avatarImage);

    currentUser!.id = this.docId;

    UserRepository.setUser(currentUser!);
  }

  @action
  Future<void> setNickName(String value) async {
    currentUser = UserModel(
        userName: this.userName,
        nickName: value,
        avatarImage: this.avatarImage);

    currentUser!.id = this.docId;

    await UserRepository.setUser(currentUser!);
  }

  @action
  Future<void> setAvatarImage(String value) async {
    currentUser = UserModel(
        userName: this.userName,
        nickName: this.nickName,
        avatarImage: value);

    currentUser!.id = this.docId;

    await UserRepository.setUser(currentUser!);
  }

  @action
  void setUser(UserModel user) {
    currentUser = UserModel(
        userName: user.userName,
        nickName: user.nickName,
        avatarImage: user.avatarImage);
    currentUser!.id = user.id;

    UserRepository.setUser(currentUser!);
  }

  @action
  Future<bool> getUserByUserName(String userName) async {
    UserModel? user = await UserRepository.getUserByUserName(userName);

    if (user != null) {
      this.currentUser = user;

      this.docId = user.id;
    }

    return user != null;
  }
}
