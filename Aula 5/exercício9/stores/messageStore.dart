import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:mobx/mobx.dart';

part 'messageStore.g.dart';

class MessageStore = _MessageStore with _$MessageStore;

abstract class _MessageStore with Store {
  _MessageStore() {
    MessageRepository.getSnapshots().listen((event) {
      messages.clear();

      messages.addAll(MessageRepository.getChatMessagesFromQuerySnapshot(
          origin, destiny, event).reversed);
    });
  }

  ObservableList<MessageModel> messages = new ObservableList<MessageModel>();

  @observable
  String origin = "";

  @observable
  String destiny = "";
}
