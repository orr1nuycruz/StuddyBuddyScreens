import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Hello Buddy!",
                  style: TextStyle(
                      fontFamily: 'Open-Sans',
                      fontSize: 50,
                      fontWeight: FontWeight.bold)),
              MascotImage(size: 300)
            ],
          ),
        ),
      ),
    );
  }
}
