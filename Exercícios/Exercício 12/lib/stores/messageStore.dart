import 'package:chat/repositories/messageRepository.dart';
import 'package:chat/repositories/userRepository.dart';
import 'package:mobx/mobx.dart';

import '../models/messageModel.dart';
part 'messageStore.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store {
  ObservableList<MessageModel> messages = ObservableList<MessageModel>();

  _MessageStore() {
    MessageRepository.getSnapshot().listen((event) {
       messages.clear();

       event.docs.forEach((element) {
         MessageModel vrMesssage = MessageModel.fromJSON(element.data() as Map<String, dynamic>);

         if (vrMesssage.canShowMessage(this.origin, this.destiny))
           messages.add(vrMesssage);
       });
    });
  }

  @observable
  String origin = "";

  @observable
  String destiny = "";

  @action
  void setData(String prOrigin, String prDestiny) {
    this.origin = prOrigin;
    this.destiny = prDestiny;
  }
}