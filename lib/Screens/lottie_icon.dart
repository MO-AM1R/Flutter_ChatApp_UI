import 'package:chat_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieIcon extends StatefulWidget {
  const LottieIcon({super.key});

  @override
  State<LottieIcon> createState() => _LottieIconState();
}

class _LottieIconState extends State<LottieIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool isFinished = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _controller.addStatusListener((status) => {
          if (status == AnimationStatus.completed)
            {
              setState(
                () => isFinished = true,
              )
            }
        });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (isFinished
        ? const HomeScreen()
        : Container(
            color: Colors.white,
            child: Lottie.asset('assets/Loading.json', controller: _controller,
                onLoaded: ((con) {
              _controller.forward();
            })),
          ));
  }
}
