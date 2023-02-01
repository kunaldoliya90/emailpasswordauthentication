// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:emailpasswordauthentication/views/HomePage.dart';
import 'package:emailpasswordauthentication/views/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // form key

  final _formKey = GlobalKey<FormState>();

  // Editing Controller

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpasswordController =
      new TextEditingController();

  // Firebase Authenticator

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50,
          ),
          // Create Account Text

          Text(
            "Create Account",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 0, 157, 230),
            ),
          ),

          // Text Form Fields

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Your Name

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter Your Name");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Type Your Name", labelText: "Name"),
                  ),

                  // Your Email Address

                  TextFormField(
                    autofocus: false,

                    //--------------------------------

                    controller: emailController,

                    //--------------------------------
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter your  Email");
                      }
                      return null;
                    },
                    //--------------------------------
                    onSaved: (value) {
                      passwordController.text = value!;
                    },
                    //--------------------------------
                    decoration: InputDecoration(
                        hintText: "Enter Your Email", labelText: "Email"),
                    //--------------------------------
                    textInputAction: TextInputAction.next,
                  ),

                  // Phone Number

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter Your Phone Number");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Type Your Phone Number",
                        labelText: "Phone Number"),
                  ),

                  // Password

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Enter Your Password");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Type Your Password", labelText: "Password"),
                  ),

                  // Confirm Password

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Confirm Your Password first");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Confirm Your Password",
                        labelText: "Confirm Password"),
                  ),

                  // Sized Box for some space between Form and create account button

                  SizedBox(
                    height: 35,
                  ),

                  // Elevated Button to create account

                  ElevatedButton(
                      style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                      onPressed: () {
                        signUp(emailController.text, passwordController.text);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return HomePage();}
                        // ));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ))
                ],
              ),
            ),
          ),

          // Row in which we have two Texts,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have an account? "),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 13, 165, 76), fontSize: 16),
                  )),
            ],
          )
        ],
      ),
    ));
  }

  void signUp(String email, String Password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: Password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
