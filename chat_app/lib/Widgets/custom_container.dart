import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const CustomContainer({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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


/* 
  
class _CustomContainer extends StatelessWidget {
  
}

* */
