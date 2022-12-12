import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/widget/my_button.dart';
import 'package:login/widget/password_field.dart';

import 'app.dart';

class ChangePasswordMaster extends StatefulWidget {
  const ChangePasswordMaster({super.key});

  @override
  State<ChangePasswordMaster> createState() => _ChangePasswordMasterState();
}

class _ChangePasswordMasterState extends State<ChangePasswordMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Change Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
            AppContainer(
              child: Column(
                children: const [
                  PasswordField(labelText: "Old Password"),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  PasswordField(labelText: "New Password"),
                  PasswordField(labelText: "Confirm New Password")
                ],
              ),
            ),
            Center(
              child: MyButton(
                text: "S A V E", 
                onPressed: (){},
                btnColor: Colors.green.shade300,
                txtColor: Colors.white,
              )
            )
          ],
        ),
      ),
    );
  }
}