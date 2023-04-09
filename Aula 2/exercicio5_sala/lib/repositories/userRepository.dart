import 'package:chat_correcao/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  static Future<void> addUser(UserModel prUser) async {
    await FirebaseFirestore.instance.collection("users").add(prUser.toJson());
  }

  static Future<List<UserModel>> getUsers() async {
    List<UserModel> vrList = [];

    QuerySnapshot vrQuery = await FirebaseFirestore.instance.collection("users").get();

    vrQuery.docs.forEach((element) {
      vrList.add(UserModel.fromJSON(element.data() as Map<String, dynamic>));
    });

    return vrList;
  }
}