import 'dart:typed_data';

import 'package:chat_proway/consts/chatType.dart';
import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class MessageRepository {
  static Future<List<MessageModel>> getAllMessages() async {
    QuerySnapshot vrQuery = await FirebaseFirestore.instance
        .collection("messages")
        .orderBy("created_at")
        .get();

    List<MessageModel> messages = [];

    vrQuery.docs.forEach((element) {
      print(element.data());

      messages.add(MessageModel.fromJson(element.data() as MapJson));
    });

    return messages;
  }

  static List<MessageModel> getChatMessagesFromQuerySnapshot(
      String origin, String destiny, QuerySnapshot<MapJson> query) {
    List<MessageModel> messages = [];

    query.docs.forEach((element) {
      messages.add(MessageModel.fromJson(element.data() as MapJson));
    });

    messages.removeWhere((element) =>
        ((element.origin != origin) && (element.destiny != origin)) &&
        ((element.origin != destiny) && (element.destiny != destiny)));

    return messages;
  }

  static Future<List<MessageModel>> getChatMessages(
      UserModel origin, UserModel destiny) async {
    List<MessageModel> messages = await MessageRepository.getAllMessages();

    messages.removeWhere((element) =>
        ((element.origin != origin.userName) &&
            (element.destiny != origin.userName)) &&
        ((element.origin != destiny.userName) &&
            (element.destiny != destiny.userName)));

    return messages;
  }

  static Future<String> sendMessage(MessageModel message) async {
    DocumentReference doc = await FirebaseFirestore.instance
        .collection("messages")
        .add(message.toJson());

    return doc.id;
  }

  static Stream<QuerySnapshot<MapJson>> getSnapshots() {
    return FirebaseFirestore.instance
        .collection("messages")
        .orderBy("created_at")
        .snapshots();
  }

  static Future<void> sendPhotoMessage(
      XFile file, UserModel origin, UserModel destiny) async {
    var storageInstance = FirebaseStorage.instance.ref();

    var ref = storageInstance
        .child("messageImages/${DateTime.now().millisecondsSinceEpoch}");

    var upload = await ref.putData(await file.readAsBytes());

    MessageRepository.sendMessage(MessageModel.asImage(
        origin: origin.userName, destiny: destiny.userName, param: await upload.ref.getDownloadURL()));
  }
}
