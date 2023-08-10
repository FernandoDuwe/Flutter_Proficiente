import 'package:chat_proway/models/messageModel.dart';
import 'package:chat_proway/models/userModel.dart';
import 'package:chat_proway/repositories/messageRepository.dart';
import 'package:chat_proway/stores/currentUserStore.dart';
import 'package:chat_proway/stores/messageFormStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class BottomMessageForm extends StatefulWidget {
  final UserModel destiny;

  BottomMessageForm({required this.destiny, Key? key}) : super(key: key);

  @override
  State<BottomMessageForm> createState() => _BottomMessageFormState();
}

class _BottomMessageFormState extends State<BottomMessageForm> {
  TextEditingController editingController = TextEditingController();

  late FocusNode focusNode;

  MessageFormStore formStore = MessageFormStore();

  Future<void> Internal_SendMessage(BuildContext context) async {
    MessageModel vrMessage = MessageModel.asText(
        origin: Provider.of<CurrentUserStore>(context).userName,
        destiny: this.widget.destiny.userName,
        messageText: formStore.message);

    await formStore.sendMessage(vrMessage);

    editingController.text = formStore.message;

    focusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();

    this.focusNode = FocusNode();
  }

  @override
  void dispose() {
    this.focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextField(
                focusNode: focusNode,
                //enabled: !formStore.processing,
                textInputAction: TextInputAction.send,
                onSubmitted: (value) => this.Internal_SendMessage(context),
                controller: this.editingController,
                onChanged: (value) => this.formStore.setMessage(value),
                decoration: InputDecoration(
                    labelText: "Digite sua mensagem", border: InputBorder.none),
              )),
              (formStore.processing
                  ? CircularProgressIndicator()
                  : IconButton(
                      onPressed: (formStore.canSend
                          ? () {
                              this.Internal_SendMessage(context);
                            }
                          : null),
                      icon: Icon(
                        Icons.send,
                        color: (this.formStore.canSend
                            ? Colors.greenAccent
                            : Colors.grey),
                      )))
            ],
          ),
        );
      },
    );
  }
}
