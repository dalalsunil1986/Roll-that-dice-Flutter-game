import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List images = [
    "assets/1.png",
    "assets/2.png",
    "assets/3.png",
    "assets/4.png",
    "assets/5.png",
    "assets/6.png",
  ];

  int dice1 = 0;
  int dice2 = 4;

  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Roll that Dice"),
            InkWell(
              onTap: () async {
                setState(() {
                  _opacity = 0;
                });
                Random random = Random();

                int number1 = random.nextInt(6);
                int number2 = random.nextInt(6);

                await Future.delayed(Duration(seconds: 1));

                setState(() {
                  _opacity = 1;
                  dice1 = number1;
                  dice2 = number2;
                });
              },
              child: AnimatedOpacity(
                duration: Duration(
                  seconds: 1,
                ),
                opacity: _opacity,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(images[dice1]),
                        width: 128,
                        height: 128,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage(images[dice2]),
                        width: 128,
                        height: 128,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text("Tap on the dice"),
          ],
        ),
      ),
    );
  }
}
