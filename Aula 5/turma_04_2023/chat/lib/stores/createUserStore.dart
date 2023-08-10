import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/userRepository.dart';
import 'package:mobx/mobx.dart';

part 'createUserStore.g.dart';

class CreateUserStore = _CreateUserStore with _$CreateUserStore;

abstract class _CreateUserStore with Store {
  @observable
  String userName = "";

  @observable
  String nickName = "";

  @observable
  bool processing = false;

  @observable
  bool saved = false;

  @observable
  String errorMessage = "";

  @computed
  bool get canSave => (this.userName.trim().isNotEmpty) && (this.nickName.trim().isNotEmpty);

  @computed
  bool get hasError => this.errorMessage.isNotEmpty;

  @action
  Future<void> save() async {
    this.processing = true;

    try {
      UserModel? vrUser = await UserRepository.getUserByUserName(this.userName);

      if (vrUser != null) {
        this.errorMessage = "Já existe um usuário cadastrado como ${this.userName}";

        return;
      }

      await UserRepository.addUser(UserModel(userName: this.userName, nicKName: this.nickName));

      this.saved = true;
    } finally {
      this.processing = false;
    }
  }

  @action
  void setUserName(String prUserName) {
    this.userName = prUserName;

    this.errorMessage = "";
  }

  @action
  void setNickName(String prNickName) {
    this.nickName = prNickName;

    this.errorMessage = "";
  }
}