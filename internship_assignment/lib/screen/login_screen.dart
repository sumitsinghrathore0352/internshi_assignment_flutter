import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internship_assignment/camera.dart';


class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
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
          image: AssetImage('assets/images/login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 25,
                top: 100,
              ),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailTextController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        hintText: 'Password',
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
                            color: Color(0xff4c505b),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () async {
                              // Use async/await here
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                );
                                print("Logged in successfully");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OpenCamera(),
                                  ),
                                );
                              } catch (error) {
                                print('Error: ${error.toString()}');
                              }
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
                            Navigator.pushNamed(context, 'register');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
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
