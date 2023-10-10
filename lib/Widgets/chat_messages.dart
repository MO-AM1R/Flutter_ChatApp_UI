import 'package:chat_app/Models/chat.dart';
import 'package:flutter/material.dart';
import '../Functions/get_time.dart';

class ChatMessages extends StatelessWidget {
  final Chat chat;
  final ScrollController scrollController;

  const ChatMessages({super.key, required this.chat, required this.scrollController});

  List<String> splitTextIntoLines(String text, double maxWidth) {
    List<String> lines = [];
    String currentLine = '';

    for (int i = 0; i < text.length; i++) {
      final painter = TextPainter(
        text: TextSpan(text: currentLine + text[i]),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: double.infinity);
      if (painter.width <= maxWidth) {
        currentLine += text[i];
      } else {
        lines.add(currentLine);
        currentLine = text[i];
      }
    }
    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          reverse: true,
          itemCount: chat.messages!.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: chat.messages![index].senderId == '1'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.9),
                decoration: BoxDecoration(
                    color: chat.messages![index].senderId == '1'
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: splitTextIntoLines(
                        chat.messages![index].text,
                        MediaQuery.of(context).size.width * 0.5,
                      )
                          .map((line) => Text(
                                line,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      getTime(chat.messages![index].sentAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
