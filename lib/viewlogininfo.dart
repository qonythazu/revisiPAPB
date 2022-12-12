import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/app.dart';
import 'package:login/generatepassword.dart';
import 'package:login/widget/my_button.dart';
import 'package:login/widget/password_field.dart';

class ViewCredentialInfo extends StatefulWidget {
  const ViewCredentialInfo({super.key});

  @override
  State<ViewCredentialInfo> createState() => _ViewCredentialInfoState();
}

class _ViewCredentialInfoState extends State<ViewCredentialInfo> {
  var name = "Facebook";
  var username = "qonythazu";
  var password = "password";
  var sites = ["facebook.com"];
  var notes = "Akun facebook buat bisnis";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Login Info",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            AppContainer(
              child: Expanded(
                  child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: name),
                      decoration: const InputDecoration(
                          icon: Icon(Icons.web), labelText: "Nama"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: username),
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person), labelText: "Username"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: PasswordField(
                      readOnly: true,
                      controller: TextEditingController(text: password),
                      labelText: "Password",
                      suffixIcon: [
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () async {
                            Clipboard.setData(ClipboardData(text: password))
                                .then(
                              (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Password copied to clipboard"),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      for (var i = 0; i < sites.length; ++i)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            readOnly: true,
                            controller: TextEditingController(text: sites[i]),
                            decoration: InputDecoration(
                                icon: Icon(Icons.web),
                                labelText: "URL ${i + 1}",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        sites.removeAt(i);
                                      });
                                    },
                                    icon: Icon(Icons.remove))),
                          ),
                        )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: notes),
                      decoration: const InputDecoration(
                          labelText: "Notes", icon: Icon(Icons.note)),
                      minLines: 2,
                      maxLines: null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 4),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade400,
                                shape: const StadiumBorder(),
                                minimumSize: const Size(50, 50)),
                            child: const Icon(Icons.edit)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 4),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade400,
                                shape: const StadiumBorder(),
                                minimumSize: const Size(50, 50)),
                            child: const Icon(Icons.delete)),
                      )
                    ],
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
