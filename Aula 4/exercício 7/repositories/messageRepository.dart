import 'package:chat_proway/consts/chatType.dart';
import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  static Future<List<MessageModel>> getAllMessages() async {
    QuerySnapshot vrQuery =
        await FirebaseFirestore.instance.collection("messages").orderBy("created_at").get();

    List<MessageModel> messages = [];

    vrQuery.docs.forEach((element) {
      print(element.data());

      messages.add(MessageModel.fromJson(element.data() as MapJson));
    });

    return messages;
  }

  static Future<List<MessageModel>> getChatMessages(
      UserModel origin, UserModel destiny) async {

    List<MessageModel> messages = await MessageRepository.getAllMessages();

    messages.removeWhere((element) => ((element.origin != origin.userName) && (element.destiny != origin.userName)) &&
                                      ((element.origin != destiny.userName) && (element.destiny != destiny.userName)));

    return messages;
  }

  static Future<String> sendMessage(MessageModel message) async {
    DocumentReference doc = await FirebaseFirestore.instance.collection("messages").add(message.toJson());

    return doc.id;
  }
}
