import 'package:chat/models/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  static Future<List<MessageModel>> getMessages(String prOriginUser, String prDestinyUser) async {
    List<MessageModel> vrList = [];

    QuerySnapshot vrQuery = await FirebaseFirestore.instance.collection("messages").orderBy("timestamp").get();

    vrQuery.docs.forEach((element) {
      MessageModel vrMesssage = MessageModel.fromJSON(element.data() as Map<String, dynamic>);

      if (vrMesssage.canShowMessage(prOriginUser, prDestinyUser))
        vrList.add(vrMesssage);
    });

    return vrList;
  }

  static Future<void> addMessage(MessageModel prMessage) async {
    await FirebaseFirestore.instance.collection("messages").add(prMessage.toJSON());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshot() {
    return FirebaseFirestore.instance.collection("messages").orderBy("timestamp").snapshots();
  }
}