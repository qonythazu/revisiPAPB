import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatefulWidget {
  const MyButton(
    {super.key,
    required this.text,
    required this.onPressed, 
    required this.btnColor, required this.txtColor
    }
  );
  final String text;
  final GestureTapCallback onPressed;
  final Color btnColor;
  final Color txtColor;

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
          backgroundColor: widget.btnColor,
          shape: const StadiumBorder(),
          minimumSize: const Size(200, 50)
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: widget.txtColor
          ),
        )),
    );
  }
}