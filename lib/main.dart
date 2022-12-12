import 'package:flutter/material.dart';
import 'package:login/folder.dart';
import 'package:login/widget/my_button.dart';
import 'package:login/widget/password_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
      ),
      home: const LoginPage(title: 'Login'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [0.1, 0.8],
              colors: [Colors.blue.shade300, Colors.yellow.shade300])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset: const Offset(0, 4))
                    ]),
                width: 250,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Positioned(
                                child: CircleAvatar(
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.asset('assets/pswdlogo.png'),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), labelText: "Username"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                      child: PasswordField(labelText: "Password")
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(title: "regist")
                            )
                          );
                        },
                        child: const Text("Sign Up")),
                    MyButton(
                      text: "L O G I N", 
                      onPressed: (){
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => FolderList()
                          )
                        );
                      },
                      color: Colors.yellow.shade300,
                    )
                  ],
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [0.1, 0.8],
              colors: [Colors.blue.shade300, Colors.yellow.shade300])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset: const Offset(0, 4))
                    ]),
                width: 250,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Positioned(
                                child: CircleAvatar(
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.asset('assets/pswdlogo.png'),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email), labelText: "Email"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), labelText: "Username"),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                      child: PasswordField(labelText: "Password")
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                      child: PasswordField(labelText: "Confirm Password")
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => LoginPage(title: 'login'))
                          );
                        },
                        child: const Text("Sign In")),
                    MyButton(
                      text: "R E G I S T E R", 
                      onPressed: (){
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => FolderList()
                          )
                        );
                      },
                      color: Colors.yellow.shade300,
                    )
                  ],
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}