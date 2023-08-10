import 'package:chat_proway/models/messageModel.dart';
import 'package:mobx/mobx.dart';

import '../repositories/messageRepository.dart';

part 'messageFormStore.g.dart';

class MessageFormStore = _MessageFormStore with _$MessageFormStore;

abstract class _MessageFormStore with Store {
  @observable
  String message = "";

  @observable
  bool processing = false;

  @computed
  bool get canSend => (this.message.trim() != "");

  @action
  void setMessage(String prNewMessage) {
    this.message = prNewMessage;
  }

  @action
  Future<void> sendMessage(MessageModel prMessage) async {
    try {
      this.processing = true;

      await MessageRepository.addMessage(prMessage);

      this.message = "";
    } finally {
      this.processing = false;
    }
  }
}