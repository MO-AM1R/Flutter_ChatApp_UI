import 'package:chat_app/Functions/get_time.dart';
import 'package:chat_app/Models/chat.dart';
import 'package:chat_app/Models/message.dart';
import 'package:chat_app/Models/user.dart';
import 'package:chat_app/Widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messages extends StatelessWidget {
  const Messages({
    super.key,
    required this.height,
    required this.chats,
  });

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height,
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            User user =
                chats[index].users!.where((user) => user.id != '1').first;

            chats[index].messages!.sort(
                  (a, b) => b.sentAt.compareTo(a.sentAt),
                );
            Message lastMessage = chats[index].messages!.first;

            return ListTile(
              onTap: () {
                Get.toNamed('/chat', arguments: [user, chats[index]]);
              },
              trailing: Text(
                getTime(lastMessage.sentAt),
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
