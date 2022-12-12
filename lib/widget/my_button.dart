import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  const MyButton(
    {super.key,
    required this.text,
    required this.onPressed
    }
  );
  final String text;
  final GestureTapCallback onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow.shade300,
          shape: const StadiumBorder(),
          minimumSize: const Size(200, 50)
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.blue.shade300
          ),
        )),
    );
  }
}