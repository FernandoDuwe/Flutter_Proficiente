import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userModel.dart';

class UserRepository {
  static Future<List<UserModel>> getUsers() async {
    List<UserModel> vrList = [];

    QuerySnapshot vrQuery =
    await FirebaseFirestore.instance.collection("users").get();

    vrQuery.docs.forEach((element) {
      vrList.add(UserModel.fromJSON(
          element.id, element.data() as Map<String, dynamic>));
    });

    return vrList;
  }

  static Future<void> addUser(UserModel prUser) async {
    await FirebaseFirestore.instance.collection("users").add(prUser.toJSON());
  }

  static Future<UserModel?> getUserByUserName(String prUserName) async {
    QuerySnapshot vrQuery = await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: prUserName)
        .get();

    if (vrQuery.docs.isEmpty) {
      print("User not found: ${prUserName}");

      return null;
    }

    print("User founded: ${prUserName}");

    return UserModel.fromJSON(
        vrQuery.docs[0].id, vrQuery.docs[0].data() as Map<String, dynamic>);
  }

  static Future<void> saveUser(UserModel prUser) async {
    await FirebaseFirestore.instance.collection("users").doc(prUser.documentId).update(prUser.toJSON());
  }
}