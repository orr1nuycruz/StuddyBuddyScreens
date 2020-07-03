import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Hello Buddy!",
                  style: TextStyle(
                      fontFamily: 'Open-Sans',
                      fontSize: SizeConfig.safeBlockHorizontal*10.5,
                      fontWeight: FontWeight.bold)),
              MascotImage(size: SizeConfig.blockSizeHorizontal * 60,),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 10,
              )

            ],
          ),
        ),
      ),
    );
  }
}
