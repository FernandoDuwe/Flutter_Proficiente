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
  void setNickName(String value) {
    currentUser = UserModel(
        userName: this.userName,
        nickName: value,
        avatarImage: this.avatarImage);

    currentUser!.id = this.docId;

    UserRepository.setUser(currentUser!);
  }

  @action
  void setAvatarImage(String value) {
    currentUser = UserModel(
        userName: this.userName,
        nickName: this.nickName,
        avatarImage: value);

    currentUser!.id = this.docId;

    UserRepository.setUser(currentUser!);
  }

  @action
  void getUserByUserName(String userName) {
    UserRepository.getUserByUserName(userName).then((value) {
      this.currentUser = value;

      if (value != null) this.docId = value!.id;
    });
  }
}
