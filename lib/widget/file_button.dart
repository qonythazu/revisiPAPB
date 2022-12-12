import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FileButton extends StatefulWidget {
  const FileButton({super.key, required this.onPressed, required this.accName, required this.email});
  final GestureTapCallback onPressed;
  final String accName;
  final String email;

  @override
  State<FileButton> createState() => _FileButtonState();
}

class _FileButtonState extends State<FileButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: OutlinedButton(
          onPressed: widget.onPressed,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.web,
                  size: 32,
                  color: Colors.blue.shade300,
                ),
              ),
              const VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      widget.accName,
                      style: TextStyle(
                          color: Colors.blue.shade300,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      widget.email,
                      style: TextStyle(
                          color: Colors.yellow.shade300,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
