import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/app.dart';
import 'package:login/generatepassword.dart';
import 'package:login/widget/my_button.dart';
import 'package:login/widget/password_field.dart';

class CreateCredential extends StatefulWidget {
  const CreateCredential({super.key});

  @override
  State<CreateCredential> createState() => _CreateCredentialState();
}

class _CreateCredentialState extends State<CreateCredential> {

  var name = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();
  var sites = [TextEditingController()];
  var notes = TextEditingController();
  bool showPassword = false;


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
              "Add Login Info",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
            AppContainer(
              child: Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.web),
                          labelText: "Nama"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: username,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Username"
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: PasswordField(
                        controller: password,
                        labelText: "Password",
                        suffixIcon: [
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () async {
                              final String? result = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GeneratePassword())
                              );

                              if (!mounted) return;
                              if (result == null) return;

                              setState(() {
                                password.text = result;
                              });
                            },
                        )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        for (var i = 0; i < sites.length; ++i)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: sites[i],
                            decoration: InputDecoration(
                              icon: Icon(Icons.web),
                              labelText: "URL ${i + 1}",
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    sites.removeAt(i);
                                  });
                                }, 
                                icon: Icon(Icons.remove)
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: (){
                        setState(() {
                          sites.add(TextEditingController());
                        });
                      }, 
                      child: const Text("New Site")
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: notes,
                        decoration: const InputDecoration(
                          labelText: "Notes",
                          icon: Icon(Icons.note)
                        ),
                        minLines: 2,
                        maxLines: null,
                      ),
                    )
                  ],
                )
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