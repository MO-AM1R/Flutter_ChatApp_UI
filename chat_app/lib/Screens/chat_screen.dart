import 'package:chat_app/Widgets/chat_messages.dart';
import 'package:chat_app/Widgets/custom_chat_app_bar.dart';
import 'package:chat_app/Widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../Models/chat.dart';
import '../Models/message.dart';
import '../Models/user.dart';

class ChatApp extends StatefulWidget {
  @override
  const ChatApp({super.key});

  @override
  State<StatefulWidget> createState() => _ChatApp();
}

class _ChatApp extends State<ChatApp> {
  late User user;
  late Chat chat;
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ])),
        child: Scaffold(
          appBar: CustomChatAppBar(
            user: user,
          ),
          body: CustomContainer(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                ChatMessages(chat: chat, scrollController: scrollController),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textEditingController,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(
                      fillColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withAlpha(150),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: 'Type Message ...',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (textEditingController.text == '') {
                            return;
                          }
                          Message newMessage = Message(
                              senderId: '1',
                              recipientId: user.id,
                              text: textEditingController.text,
                              sentAt: DateTime.now());

                          setState(() {
                            chat.messages!.add(newMessage);
                            chat.messages!.sort(
                              (a, b) => b.sentAt.compareTo(a.sentAt),
                            );
                            textEditingController.clear();
                          });
                          scrollController.animateTo(
                              scrollController.position.minScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        icon: const Icon(Icons.send),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
