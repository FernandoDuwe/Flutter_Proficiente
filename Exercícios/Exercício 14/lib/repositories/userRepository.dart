import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../models/userModel.dart';

class UserRepository {
  static Future<List<UserModel>> getUsers(String prCurrentUser) async {
    List<UserModel> vrList = [];

    QuerySnapshot vrQuery =
        await FirebaseFirestore.instance.collection("users").get();

    vrQuery.docs.forEach((element) {
      UserModel vrUser = UserModel.fromJSON(element.id, element.data() as Map<String, dynamic>);

      if (vrUser.userName != prCurrentUser)
        vrList.add(vrUser);
    });

    return vrList;
  }

  static Future<void> addUser(UserModel prUser) async {
    await FirebaseFirestore.instance.collection("users").add(prUser.toJSON());
  }

  static Future<UserModel?> getUserFromUserName(String prUserName) async {
    QuerySnapshot vrQuery = await FirebaseFirestore.instance.collection("users").where("username", isEqualTo: prUserName).get();

    print(vrQuery);

    if (vrQuery.docs.isEmpty)
      return null;

    return UserModel.fromJSON(vrQuery.docs[0].id, vrQuery.docs[0].data() as Map<String, dynamic>);
  }

  static Future<void> updateUser(UserModel prUser) async {
    print(prUser.documentId);
    print(prUser.toJSON().toString());

    await FirebaseFirestore.instance.collection("users").doc(prUser.documentId).update(prUser.toJSON());
  }

  static Future<String> uploadFile(XFile prFile) async {
    final vrStorageRef = FirebaseStorage.instance.ref();

    final vrNewFileRef = vrStorageRef.child("avatarImages/${DateTime.now().millisecondsSinceEpoch.toString()}");

    TaskSnapshot vrTask = await vrNewFileRef.putData(await prFile.readAsBytes());

    return vrTask.ref.getDownloadURL();
  }
}