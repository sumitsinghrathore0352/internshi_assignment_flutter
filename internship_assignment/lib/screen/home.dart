import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to home Screen",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyLogin())));
                },
                child: Text("Log Out"))
          ],
        )),
      ),
    );
  }
}
