import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 10,
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, 0, SizeConfig.safeBlockHorizontal * 10, 0),
                child: Text(
                  "Hold up!",
                  style: TextStyle(
                      fontFamily: 'Open-Sans',
                      fontSize: SizeConfig.safeBlockHorizontal * 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              MascotImage(size: SizeConfig.safeBlockHorizontal * 75),
              Container(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, SizeConfig.safeBlockVertical * 6),
                child: Text(
                  "StudyBuddy is undergoing maintenance. \n Sorry for the inconvinience",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Open-Sans',
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.bold),
                ),
              ),
              RaisedButton(
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockSizeVertical * 3.5),
                  ),
                  side: BorderSide(color: Colors.white),
                ),
                child: Container(
                    width: SizeConfig.blockSizeHorizontal * 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Hexcolor("#e4b9fa"),
                          Hexcolor("#d9b9fa"),
                          Hexcolor("#b9bffa")
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.blockSizeVertical * 3.5),
                      ),
                    ),
                    child: Center(
                      child: Text("Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 6)),
                    ),
                    padding:
                        EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4)),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
