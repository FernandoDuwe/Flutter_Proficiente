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
  bool loading = false;

  @observable
  String errorMessage = "";

  @computed
  bool get canSave => this.userName.isNotEmpty && this.nickName.isNotEmpty;

  @computed
  bool get hasError => this.errorMessage.isNotEmpty;

  @action
  void setUserName(String value) {
    this.userName = value;
  }

  @action
  void setNickName(String value) {
    this.nickName = value;
  }

  @action
  Future<bool> save() async {
    this.loading = true;
    this.errorMessage = "";

    try {
      UserModel? user = await UserRepository.getUserByUserName(this.userName);

      if (user != null) {
        this.errorMessage = "Este nome de usuário já está sendo usado";

        return false;
      }

      await UserRepository.setUser(UserModel(
          userName: this.userName, nickName: this.nickName, avatarImage: ""));

      return true;
    } catch (e) {
      this.errorMessage = "Erro ao gravar: " + e.toString();

      return false;
    }
    finally {
      this.loading = false;
    }
  }
}