import 'package:chat_app/Models/user.dart';
import 'package:flutter/material.dart';

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;

  const CustomChatAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text('${user.firstName} ${user.lastName}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            Text(
              'Online',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.image),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
