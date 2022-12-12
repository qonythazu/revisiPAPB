import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FolderButton extends StatefulWidget {
  const FolderButton({super.key, required this.text, required this.onPressed});
  final String text;
  final GestureTapCallback onPressed;
  @override
  State<FolderButton> createState() => _FolderButtonState();
}

class _FolderButtonState extends State<FolderButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlinedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.folder,
                    color: Colors.yellow.shade300,
                  )),
              Text(
                widget.text,
                style: TextStyle(color: Colors.blue.shade300),
              )
            ],
          )),
    );
  }
}
