import 'package:chat_proway/consts/chatType.dart';
import 'package:chat_proway/models/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  static Future<List<MessageModel>> getAllMessages() async {
    QuerySnapshot vrQuery = await FirebaseFirestore.instance.collection("messages").get();

    List<MessageModel> messages = [];
    
    vrQuery.docs.forEach((element) {
      print(element.data());

      messages.add(MessageModel.fromJson(element.data() as MapJson));
    });

    return messages;
  }
}