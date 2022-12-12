import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

import 'package:login/app.dart';
import 'package:login/widget/my_button.dart';

class GeneratePassword extends StatefulWidget {
  const GeneratePassword({super.key});

  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  String? generatedPassword = "";

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
              "Password Generator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
            AppContainer(
              child: SizedBox.expand(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: GeneratePasswordPageWidget(
                    onGeneratePassword: (val) {
                      generatedPassword = val;
                    }
                  ),
                ),
              ),
            ),
            Center(
              child: MyButton(text: 
                "S E L E C T", 
                onPressed: (){
                  Navigator.pop(context, generatedPassword);
                },
                btnColor: Colors.green.shade300,
                txtColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GeneratePasswordOption {
  var length = 16;
  var minUpperCase = 0;
  var upperCase = true;
  var minLowerCase = 0;
  var lowerCase = true;
  var minNumber = 0;
  var number = true;
  var minSpecial = 0;
  var special = true;
  var ambiguous = false;
}

enum Case { upper, lower, number, special, any }

String generatePassword(GeneratePasswordOption o) {
  var random = Random.secure();
  List<Case> positions = [];

  final minLength =
      o.minUpperCase + o.minLowerCase + o.minNumber + o.minSpecial;
  final length = max(minLength, o.length);

  add(bool add, int min, Case val) {
    if (add && min > 0) {
      for (var i = 0; i < min; ++i) {
        positions.add(val);
      }
    }
  }

  add(o.number, o.minNumber, Case.number);
  add(o.lowerCase, o.minLowerCase, Case.lower);
  add(o.upperCase, o.minUpperCase, Case.upper);
  add(o.special, o.minSpecial, Case.special);
  while (positions.length < length) {
    positions.add(Case.any);
  }
  positions.shuffle(random);

  var allCharSet = "";

  var lowerCaseCharSet = "abcdefghijkmnopqrstuvwxyz";
  if (o.ambiguous) {
    lowerCaseCharSet += "l";
  }
  if (o.lowerCase) {
    allCharSet += lowerCaseCharSet;
  }

  var upperCaseCharSet = "ABCDEFGHJKLMNPQRSTUVWXYZ";
  if (o.ambiguous) {
    upperCaseCharSet = "IO";
  }
  if (o.upperCase) {
    allCharSet += upperCaseCharSet;
  }

  var numberCharSet = "23456789";
  if (o.ambiguous) {
    numberCharSet += "01";
  }
  if (o.number) {
    allCharSet += numberCharSet;
  }

  var specialCharSet = "!@#\$%^&*";
  if (o.special) {
    allCharSet += specialCharSet;
  }

  var password = StringBuffer("");

  if (allCharSet.isEmpty) {
    return "";
  }

  for (var i = 0; i < length; ++i) {
    String positionChars;
    switch (positions[i]) {
      case Case.lower:
        positionChars = lowerCaseCharSet;
        break;
      case Case.upper:
        positionChars = upperCaseCharSet;
        break;
      case Case.number:
        positionChars = numberCharSet;
        break;
      case Case.special:
        positionChars = specialCharSet;
        break;
      case Case.any:
        positionChars = allCharSet;
        break;
    }

    final randomIndex = random.nextInt(positionChars.length - 1);
    password.write(positionChars[randomIndex]);
  }

  return password.toString();
}

class GeneratePasswordPageWidget extends StatefulWidget {
  const GeneratePasswordPageWidget(
      {super.key, required this.onGeneratePassword});

  final Function(String) onGeneratePassword;

  @override
  State<GeneratePasswordPageWidget> createState() =>
      GeneratePasswordPageWidgetState();
}

class GeneratePasswordPageWidgetState
    extends State<GeneratePasswordPageWidget> {
  String generatedPassword = "";
  GeneratePasswordOption options = GeneratePasswordOption();
  var lengthController = TextEditingController(text: "1");

  @override
  void initState() {
    super.initState();

    lengthController.text = options.length.toString();
    lengthController.addListener(() {
      options.length = int.tryParse(lengthController.text) ?? 1;
      applyGeneratedPassword();
    });

    applyGeneratedPassword();
  }

  void applyGeneratedPassword() {
    setGeneratedPassword(generatePassword(options));
  }

  void setGeneratedPassword(String password) {
    setState(() {
      generatedPassword = password;
      widget.onGeneratePassword(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                Clipboard.setData(ClipboardData(text: generatedPassword)).then(
                  (_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Password copied to clipboard")));
                  },
                );
              },
                child: Text(
                  generatedPassword,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon((Icons.copy), color: Colors.blue.shade300, size: 12,)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300,
                shape: const StadiumBorder(),
                minimumSize: const Size(100, 50)
              ),
              onPressed: () {
                applyGeneratedPassword();
              },
              child: const Text("Generate Password", style: TextStyle(fontSize: 16),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Length", style: TextStyle(fontSize: 18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(controller: lengthController),
                    ),
                    Expanded(
                      child: Slider(
                        min: 1,
                        max: 24,
                        value: double.tryParse(lengthController.text) ?? 1,
                        onChanged: (val) {
                          setState(() {
                            lengthController.text = val.round().toString();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextToggle(
              value: options.upperCase,
              title: "A-Z", 
              onChanged: (val) {
                options.upperCase = val;
                applyGeneratedPassword();
              },
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextToggle(
              value: options.lowerCase,
              title: "a-z",
              onChanged: (val) {
                options.lowerCase = val;
                applyGeneratedPassword();
              },
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextToggle(
              value: options.number,
              title: "0-9",
              onChanged: (val) {
                options.number = val;
                applyGeneratedPassword();
              },
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextToggle(
              value: options.special,
              title: "!@#\$%^&*",
              onChanged: (val) {
                options.special = val;
                applyGeneratedPassword();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TextToggle extends StatelessWidget {
  const TextToggle(
      {super.key,
      required this.value,
      required this.title,
      required this.onChanged});

  final String title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 18),),
        const Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
        )
      ],
    );
  }
}