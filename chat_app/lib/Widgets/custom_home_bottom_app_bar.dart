import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  const CustomBottomAppBar({super.key, required this.width});

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
