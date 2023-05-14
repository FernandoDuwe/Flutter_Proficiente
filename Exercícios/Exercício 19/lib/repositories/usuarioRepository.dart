import 'package:admin_page/models/usuarioModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsuarioRepository {
  static Future<void> addUser(UsuarioModel usuario) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: usuario.usuario, password: usuario.senha);
  }
}