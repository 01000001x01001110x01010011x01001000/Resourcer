import 'package:flutter/material.dart';

abstract class CustomAnimation<T extends StatefulWidget> extends State<T>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> infoSlide;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    infoSlide = Tween<double>(begin: 0, end: 6).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  // setAnimation(TickerProvider tickerProvider) {
  //   animationController = AnimationController(
  //     vsync: tickerProvider,
  //     duration: const Duration(seconds: 1),
  //   );
  // }
}
