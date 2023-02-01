import 'dart:ffi';

import 'package:emailpasswordauthentication/views/loginpage.dart';
import 'package:flutter/material.dart';

class User_Profile_Page extends StatelessWidget {
  const User_Profile_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.black,
              child: Image.asset(
                "assets/unnamed.png",
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Text(
                  "Hello ! Test Account",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "testaccount@gmail.com",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cont. No - 98414XXXXX",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "  Log Out  ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
