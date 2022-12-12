import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/app.dart';
import 'package:login/viewlogininfo.dart';
import 'package:login/widget/file_button.dart';

class ContohIsiFolder extends StatefulWidget {
  const ContohIsiFolder({super.key});

  @override
  State<ContohIsiFolder> createState() => _ContohIsiFolderState();
}

class _ContohIsiFolderState extends State<ContohIsiFolder> {
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.folder,
                      color: Colors.yellow.shade300,
                    ),
                  ),
                  Text(
                    "Sosmed",
                    style: TextStyle(
                      color: Colors.blue.shade300
                    ),
                  )
                ],
              ),
            ),
            AppContainer(
              child: Expanded(
                child: ListView(
                  children: [
                    FileButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ViewCredentialInfo())
                        );
                      }, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                    FileButton(
                      onPressed: (){}, 
                      accName: "Facebook", 
                      email: "qonitaarif5@gmail.com"
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}