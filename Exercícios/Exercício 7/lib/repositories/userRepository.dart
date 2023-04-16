import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/userModel.dart';

class UserRepository {
  static Future<List<UserModel>> getUsers() async {
    List<UserModel> vrList = [];

    QuerySnapshot vrQuery =
        await FirebaseFirestore.instance.collection("users").get();

    vrQuery.docs.forEach((element) {
      vrList.add(UserModel.fromJSON(element.data() as Map<String, dynamic>));
    });

    return vrList;
  }

  static Future<void> addUser(UserModel prUser) async {
    await FirebaseFirestore.instance.collection("users").add(prUser.toJSON());
  }
}