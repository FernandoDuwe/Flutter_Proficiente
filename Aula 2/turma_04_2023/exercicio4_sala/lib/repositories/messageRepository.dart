import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/messageModel.dart';

class MessageRepository {
  static Future<void> addMessage(MessageModel prMessage) async {
    await FirebaseFirestore.instance.collection("messages").add(prMessage.toJSON());
  }

  static Future<List<MessageModel>> getMessages(String prOrigin, String prDestiny) async {
    List<MessageModel> vrList = [];

    QuerySnapshot vrQuery = await FirebaseFirestore.instance.collection("messages").get();

    vrQuery.docs.forEach((element) {
      MessageModel vrMessage = MessageModel.fromJSON(element.data() as Map<String, dynamic>);

      if (vrMessage.mensagemDaConversa(prOrigin, prDestiny))
        vrList.add(vrMessage);
    });

    return vrList;
  }
}