import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'createUserStore.g.dart';

class CreateUserStore = _CreateUserStore with _$CreateUserStore;

abstract class _CreateUserStore with Store {
  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  String confirmarSenha = "";

  @observable
  bool visualizarSenha = false;

  @observable
  String mensagemErro = "";

  @computed
  bool get podeSalvar => this.email.trim().isNotEmpty && this.senha.trim().isNotEmpty && (this.senha == this.confirmarSenha);

  @computed
  bool get existeErro => this.mensagemErro.trim().isNotEmpty;

  void _checkSenhas() {
    if (this.senha != this.confirmarSenha)
      this.mensagemErro = "As senhas não coincidem. Verifique!";

    if (this.senha.length < 6)
      this.mensagemErro = "A senha deve possuir pelo menos 6 caracteres";
  }

  @action
  void setEmail(String newEmail) {
    this.email = newEmail;

    this._checkSenhas();
  }

  @action
  void setSenha(String newSenha) {
    this.senha = newSenha;

    this._checkSenhas();
  }

  @action
  void setConfirmarSenha(String newConfirmarSenha) {
    this.confirmarSenha = newConfirmarSenha;
  }

  @action
  void setVisualizarSenha(bool newVisualizarSenha) {
    this.visualizarSenha = newVisualizarSenha;
  }

  @action
  Future<void> salvar() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: this.email, password: this.senha);
  }
}