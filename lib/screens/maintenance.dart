import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                child: Text(
                  "Hold up!",
                  style: TextStyle(
                      fontFamily: 'Open-Sans',
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ),
              MascotImage(size: 300),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "StudyBuddy is undergoing maintenance. \n Sorry for the inconvinience",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Open-Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 50),
              RaisedButton(
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  side: BorderSide(color: Colors.white),
                ),
                child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Hexcolor("#e4b9fa"),
                          Hexcolor("#d9b9fa"),
                          Hexcolor("#b9bffa")
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text("Continue",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    padding: const EdgeInsets.all(15.0)),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
