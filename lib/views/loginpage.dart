// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Type Your Email", labelText: "Email"),
                  ),

                  // A Sized Box for a little space

                  SizedBox(
                    height: 5,
                  ),

                  // Password TextField

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Type your Password", labelText: "Password"),
                  ),

                   SizedBox(
                    height: 25,
                  ),

                  ElevatedButton(
                    style: ButtonStyle(),
                    onPressed: (){}, 
                    child: Text("Login"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
