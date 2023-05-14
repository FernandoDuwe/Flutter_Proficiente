import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'loginStore.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String username = "";

  @observable
  String password = "";

  @observable
  String messageError = "";

  @computed
  bool get canLogin => this.username.isNotEmpty && this.password.isNotEmpty;

  @computed
  bool get hasError => this.messageError.isNotEmpty;

  @action
  void setUserName(String newUserName) {
    this.username = newUserName;
  }

  @action
  void setPassword(String newPassword) {
    this.password = newPassword;
  }

  @action
  Future<bool> login() async {

    try {
      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: this.username, password: this.password);

      return true;
    } catch(e) {
      this.messageError = e.toString();
    }

    return false;
  }
}