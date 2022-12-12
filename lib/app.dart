import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth * 80,
      height: MediaQuery.of(context).size.height * (70 / 100),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}