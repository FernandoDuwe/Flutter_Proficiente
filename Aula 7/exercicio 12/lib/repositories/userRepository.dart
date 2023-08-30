import 'package:chat_proway/consts/chatType.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

// Classe repositório para a coleção de Usuários
class UserRepository {
  static Future<List<UserModel>> getUsers(String currentUser) async {
    QuerySnapshot vrQuery = await FirebaseFirestore.instance
        .collection("users")
        .where("username", isNotEqualTo: currentUser)
        .get();

    List<UserModel> userList = [];

    vrQuery.docs.forEach((element) {
      userList.add(UserModel.fromJson(element.data() as MapJson, element.id));
    });

    return userList;
  }

  static Future<UserModel?> getUserByUserName(String userName) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: userName)
        .get();

    if (query.size <= 0) return null;

    return UserModel.fromJson(
        query.docs[0].data() as Map<String, dynamic>, query.docs[0].id);
  }

  static Future<void> setUser(UserModel user) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.id)
        .update(user.toJson());
  }

  static Future<String> uploadAvatarImage(XFile file) async {
    var storageRef = FirebaseStorage.instance.ref();

    var ref = storageRef.child("avatarImages/${DateTime
        .now()
        .millisecondsSinceEpoch}");
    
    TaskSnapshot task = await ref.putData(await file.readAsBytes());

    return task.ref.getDownloadURL();
  }
}
