// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:emailpasswordauthentication/views/loginpage.dart';
import 'package:emailpasswordauthentication/views/onboardingstylepages/firstpage.dart';
import 'package:emailpasswordauthentication/views/onboardingstylepages/secondpage.dart';
import 'package:emailpasswordauthentication/views/onboardingstylepages/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  // To Keep track on which page we are?

  PageController _controller = PageController();

  // Keep Track if we are on the last page

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              FirstPage(),
              SecondPage(),
              ThirdPage(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Skip Text
        
                  GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                      child: Text('S K I P', style: TextStyle(fontWeight: FontWeight.w700,),)),
        
                  // pageindicator
        
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                  ),
        
                  // Next Page or Done
        
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                          },
                          child: Text('D O N E', style: TextStyle(fontWeight: FontWeight.w700),))
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text('N E X T',style: TextStyle(fontWeight: FontWeight.w700))),
                ],
              )),
        ]),
      ),
    );
  }
}
