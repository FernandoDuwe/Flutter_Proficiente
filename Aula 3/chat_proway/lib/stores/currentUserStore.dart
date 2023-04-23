import 'package:chat_proway/models/userModel.dart';
import 'package:mobx/mobx.dart';

import '../repositories/userRepository.dart';

part 'currentUserStore.g.dart';

class CurrentUserStore = _CurrentUserStore with _$CurrentUserStore;

abstract class _CurrentUserStore with Store {
  @observable
  UserModel? currentUser;

  @observable
  String userName = "";

  @computed
  String get currentUserNickName => (this.currentUser == null ? "" : this.currentUser!.nicKName);

  @computed
  String get currentUserAvatarImage => (this.currentUser == null ? "" : this.currentUser!.avatarImage);

  @computed
  bool get currentUserHasDocument => this.currentUser != null;

  @action
  Future<void> setUserName(String prUsername) async {
    this.userName = prUsername;

    this.currentUser = await UserRepository.getUserByUserName(prUsername);
  }
}