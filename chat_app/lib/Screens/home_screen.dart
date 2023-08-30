import 'package:chat_app/Models/chat.dart';
import 'package:chat_app/Models/message.dart';
import 'package:chat_app/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          appBar: const _CustomAppBar(),
          body: Column(
            children: [
              _ChatContacts(height: height, users: users),
              Expanded(
                  child: Stack(fit: StackFit.expand, children: [
                _ChatMessages(height: height, chats: chats),
                _CustomBottomAppBar(
                  width: width,
                )
              ]))
            ],
          ),
        ));
  }
}

class _CustomBottomAppBar extends StatelessWidget {
  @override
  const _CustomBottomAppBar({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width * 0.5,
        height: 60,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withAlpha(150),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.message_rounded),
                iconSize: 30,
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.person_add_alt_1_rounded),
                iconSize: 30,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    required this.height,
    required this.chats,
  });

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return _CustomContainer(
      height: height,
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            User user =
                chats[index].users!.where((user) => user.id != '1').first;

            chats[index].messages!.sort(
                  (a, b) => a.sentAt.compareTo(b.sentAt),
                );
            Message lastMessage = chats[index].messages!.last;

            return ListTile(
              onTap: () {
                Get.toNamed('chat', arguments: {user, chats[index]});
              },
              trailing: Text(
                '${lastMessage.sentAt.hour} : ${lastMessage.sentAt.minute}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(user.image),
              ),
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                lastMessage.text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({required this.height, required this.child});

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.66,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: child,
    );
  }
}

class _ChatContacts extends StatelessWidget {
  const _ChatContacts({
    required this.height,
    required this.users,
  });

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: ListView.builder(
          itemCount: users.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(users[index].image),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    users[index].firstName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Chats',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: IconTheme.of(context).color,
          ),
          onPressed: () {
            Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            );
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
