import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'loginStore.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  String mensagemErro = "";

  @observable
  bool processando = false;

  @computed
  bool get podeEfetuarLogin => ((this.email.trim().isNotEmpty) && (this.senha.trim().isNotEmpty));

  @computed
  bool get possuiErro => this.mensagemErro.isNotEmpty;

  @action
  void setEmail(String novoEmail) => this.email = novoEmail;

  @action
  void setSenha(String novaSenha) => this.senha = novaSenha;

  @action
  Future<void> login() async {
    this.processando = true;

    try {
      print(this.email);
      print(this.senha);

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: this.email, password: this.senha);
    } catch (e) {
      this.mensagemErro = e.toString();
    }

    this.processando = false;
  }
}