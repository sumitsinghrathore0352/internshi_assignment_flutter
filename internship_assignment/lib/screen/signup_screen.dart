import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/screen/home.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/register.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 25,
                top: 25,
              ),
              child: Text(
                'Create\nAccount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.23,
                  right: 35,
                  left: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: _emailTextController, // Add this line
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _passwordTextController, // Add this line
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color.fromARGB(255, 247, 248, 252),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              )
                                  .then((value) {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()))
                                    .onError((error, stackTrace) =>
                                        print('Error: ${error.toString()}'));
                              });
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            'Sign in ',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color.fromARGB(255, 240, 241, 244),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
