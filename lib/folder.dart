import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/app.dart';
import 'package:login/changepassword.dart';
import 'package:login/generatepassword.dart';
import 'package:login/isifolder.dart';
import 'package:login/main.dart';
import 'package:login/nambahform.dart';
import 'package:login/widget/folder_button.dart';

class FolderList extends StatefulWidget {
  const FolderList({super.key});

  @override
  State<FolderList> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          elevation: 0,
        ),
        drawer: const SideNavigation(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => CreateCredential())
            );
          },
          backgroundColor: Colors.yellow.shade300,
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Password",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search...",
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              AppContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Folders",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue.shade300,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Colors.yellow.shade300,)),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              FolderButton(
                                  text: "Sosmed",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ContohIsiFolder()));
                                  }),
                              FolderButton(text: "Belajar", onPressed: () {}),
                              FolderButton(text: "Hiburan", onPressed: () {}),
                              FolderButton(text: "Game", onPressed: () {}),
                              FolderButton(text: "Perkuliahan", onPressed: () {}),
                              FolderButton(text: "Shopping", onPressed: () {}),
                              FolderButton(text: "Dompet Digital", onPressed: () {}),
                              FolderButton(text: "Google", onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

//BUAT SIDE BAR NYA :))
class SideNavigation extends StatelessWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[buildHeader(context), buildMenuItems(context)],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.blue.shade300,
        padding: const EdgeInsets.only(top: 16, bottom: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 48.0,
              child: ClipRect(
                child: Image.asset('assets/pswdlogo.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Blank Password",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.lock_outlined),
              title: Text(
                "Your Password",
                style: TextStyle(color: Colors.blue.shade300, fontSize: 16),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => FolderList())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: Text(
                "Password Generator",
                style: TextStyle(color: Colors.blue.shade300, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneratePassword())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.password),
              title: Text(
                "Change PasswordMaster",
                style: TextStyle(color: Colors.blue.shade300, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordMaster())
                );
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: Text(
                "Sign Out",
                style: TextStyle(color: Colors.red.shade400, fontSize: 16),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(
                              title: 'login',
                            )));
              },
            )
          ],
        ),
      );
}
