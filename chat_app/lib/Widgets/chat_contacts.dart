import 'package:chat_app/Models/user.dart';
import 'package:flutter/material.dart';

class ChatContacts extends StatelessWidget {
  const ChatContacts({super.key, 
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
