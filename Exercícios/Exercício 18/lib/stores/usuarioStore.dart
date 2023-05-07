import 'package:admin_page/models/usuarioModel.dart';
import 'package:admin_page/repositories/usuarioRepository.dart';
import 'package:mobx/mobx.dart';
part 'usuarioStore.g.dart';

class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  @observable
  String usuario = "";

  @observable
  String senha = "";

  @computed
  bool get canSave => ((this.usuario.isNotEmpty) && (this.senha.isNotEmpty));

  @action
  void setUsuario(String user) {
    this.usuario = user;
  }

  @action
  void setSenha(String password) {
    this.senha = password;
  }

  @action
  Future<void> save() async {
    await UsuarioRepository.addUser(UsuarioModel(usuario: this.usuario, senha: this.senha));
  }
}