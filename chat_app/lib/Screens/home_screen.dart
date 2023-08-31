import 'package:chat_app/Models/chat.dart';
import 'package:chat_app/Models/user.dart';
import 'package:chat_app/Widgets/chat_contacts.dart';
import 'package:chat_app/Widgets/custom_home_app_bar.dart';
import 'package:chat_app/Widgets/custom_home_bottom_app_bar.dart';
import 'package:chat_app/Widgets/messages.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    List<User> users = User.users;
    List<Chat> chats = Chat.chats;

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
          appBar: const CustomHomeAppBar(),
          body: Column(
            children: [
              ChatContacts(height: height, users: users),
              Expanded(
                  child: Stack(fit: StackFit.expand, children: [
                Messages(height: height, chats: chats),
                CustomBottomAppBar(
                  width: width,
                )
              ]))
            ],
          ),
        ));
  }
}




