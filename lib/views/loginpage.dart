// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:emailpasswordauthentication/views/HomePage.dart';
import 'package:emailpasswordauthentication/views/signup.dart';
import 'package:emailpasswordauthentication/views/user_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form key

  final _formKey = GlobalKey<FormState>();

  // Editing Controller

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // Firebase Authenticator

  final _auth = FirebaseAuth.instance;

  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login  Page",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 0, 157, 230),
                ),
              ),

              // Different Column for Email & Password

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                child: Column(
                  children: [
                    Text(
                      "Welcome! $name",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),

                    // Welcome with name.

                    SizedBox(
                      height: 30,
                    ),

                    // Spaces

                    TextFormField(
                      autofocus: false,
                      //-------------------------------
                      keyboardType: TextInputType.emailAddress,
                      //--------------------------------
                      controller: emailController,

                      //--------------------------------
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Invalid Email");
                        }
                        return null;
                      },
                      //--------------------------------
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      //--------------------------------
                      decoration: InputDecoration(
                          hintText: "Enter Your Email", labelText: "Email"),
                      //--------------------------------
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                        //--------------------------------
                      },
                      textInputAction: TextInputAction.next,
                    ),

                    // A Sized Box for a little space

                    SizedBox(
                      height: 5,
                    ),

                    // Password TextField

                    TextFormField(
                      autofocus: false,
                      obscureText: true,

                      //--------------------------------

                      controller: passwordController,

                      //--------------------------------
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Invalid Password");
                        }
                        return null;
                      },
                      //--------------------------------
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      //--------------------------------
                      decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password"),
                      //--------------------------------
                      textInputAction: TextInputAction.done,
                    ),

                    // Sized Box

                    SizedBox(
                      height: 35,
                    ),

                    // Elevated Button for Login

                    ElevatedButton(
                        style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        onPressed: () {
                          signIn(emailController.text, passwordController.text);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ))
                  ],
                ),
              ),

              // Row in which we have two Texts,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                      child: Text(
                        "Create One",
                        style: TextStyle(
                            color: Color.fromARGB(255, 13, 165, 76),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void signIn(String email, String Password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: Password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => User_Profile_Page())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
