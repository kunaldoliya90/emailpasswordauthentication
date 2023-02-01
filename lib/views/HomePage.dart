import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index){
        return Row(
          children: [
            Container(
              height: 400,
              color: Colors.black38,
            ),
            Container(
              height: 400,
              color: Colors.black38,
            ),
            Container(
              height: 400,
              color: Colors.black38,
            ),
            Container(
              height: 400,
              color: Colors.black38,
            ),

          ],
        );
      }
      ),
    );
  }
}
