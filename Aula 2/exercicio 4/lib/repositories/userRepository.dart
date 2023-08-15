import 'package:chat_proway/consts/chatType.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Classe repositório para a coleção de Usuários
class UserRepository {
  static Future<List<UserModel>> getUsers() async {
    QuerySnapshot vrQuery = await FirebaseFirestore.instance.collection("users").get();

    List<UserModel> userList = [];

    vrQuery.docs.forEach((element) {
      userList.add(UserModel.fromJson(element.data() as MapJson));
    });

    return userList;
  }
}