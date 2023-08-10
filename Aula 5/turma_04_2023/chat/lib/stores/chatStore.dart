import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:mobx/mobx.dart';

part 'chatStore.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  ObservableList<MessageModel> messages = ObservableList<MessageModel>();

  _ChatStore() {
    MessageRepository.getSnapshot().listen((event) {

      this.messages.clear();
      
      event.docs.reversed.forEach((element) {
        MessageModel vrMessage = MessageModel.fromJSON(element.data());

        if (vrMessage.canShowMessage(this.origin, this.destiny))
          this.messages.add(vrMessage);
      });
    });
  }

  @observable
  String origin = "";

  @observable
  String destiny = "";

  @action
  void setOriginDestiny(String prOrigin, String prDestiny) {
    this.origin = prOrigin;
    this.destiny = prDestiny;
  }
}