import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studdyBuddyScreens/screens/preferences/question01.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';
import 'package:studdyBuddyScreens/model/BaseAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:studdyBuddyScreens/sharedWidgets/fullScreenSnackBar.dart';
import '../Login.dart';
import '../register.dart';

class ConfirmAccount extends StatefulWidget {
  @override
  _ConfirmAccountState createState() => _ConfirmAccountState();
}

class _ConfirmAccountState extends State<ConfirmAccount> {
  List<String> list = new List();
  final databaseReference = Firestore.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String ans1;
  String ans2;
  String ans3;
  String ans4;

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => list = prefs.getStringList('userInfo'));
  }

  void getAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ans1 = prefs.getString('answer01');
      ans2 = prefs.getString('answer02');
      ans3 = prefs.getString('answer03');
      ans4 = prefs.getString('answer04');
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    getAnswers();
  }

  void createUser() async {
    final status = await AuthController().checkUserExists(list[0]);
    /*If new user does not exists in the system */
    if (status == false) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(days: 1),
        content: FullScreenSnackBar(
          icon: Icons.thumb_up,
          genericText: "Hi ${list[2]}, Please Verify Your Email ",
          inkButtonText: "<- To Login",
          function: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                ModalRoute.withName('/loginPage'));
          },
        ),
      ));

      AuthController()
          .signUp(list[0], list[1])
          .then((user) => AuthController().sendEmailVerification())
          .catchError((onError) => print("invalid"));

      databaseReference.collection("MainsUsers").document(list[0]).setData({
        'First Name': list[2],
        'Last Name': list[3],
        "Age": list[4],
        "Gender": list[5],
        "City": list[6],
        "Preferences": {
          "Answer 01": ans1,
          "Answer 02": ans2,
          "Answer 03": ans3,
          "Answer 04": ans4,
        }
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(days: 1),
        backgroundColor: Theme.of(context).errorColor,
        content: FullScreenSnackBar(
            icon: Icons.thumb_down,
            genericText:
                "Hi ${list[2]}, we are unable to register you because...\n" +
                    "\n-Pre-existing account\n-An unverified account\n-Poor Connection",
            inkButtonText: "<- Back To Login",
            function: () {
              // MaterialPageRoute route =
              //     MaterialPageRoute(builder: (context) => Login());
              // Navigator.of(context).push(route);
              Navigator.of(context).pop();
            },
            inkButtonText2: "<- Back to Register",
            function2: () {
              // MaterialPageRoute route =
              //     MaterialPageRoute(builder: (context) => Register());
              // Navigator.of(context).pop(route);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Register()),
                  ModalRoute.withName('/registerPage'));
            }),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 7,
            bottom: SizeConfig.safeBlockHorizontal * 1,
            left: SizeConfig.safeBlockHorizontal * 1),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Center(
            child: Column(
          children: <Widget>[
            Text(
              "Here are your answers. \nConfirm Account?",
              style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 8,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 8,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: Text(
                "What beverage would you prefer to drink",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 1),
              child: Text(
                ans1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 8,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: Text(
                "What is the reason for using this app?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 1),
              child: Text(
                ans2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 8,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: Text(
                "What is your highest education attained",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 1),
              child: Text(
                ans3,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 8,
            ),
            Container(
              width: SizeConfig.screenWidth,
              child: Text(
                "What languages do you speak",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 1),
              child: Text(
                ans4,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
            ),
            Text(list[0]),
            Text(list[1]),
            Text(list[2]),
            Text(list[3]),
            Text(list[4]),
            Text(list[5]),
            Text(list[6]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.blockSizeVertical * 3.5),
                    ),
                    side: BorderSide(color: Colors.white),
                  ),
                  child: Container(
                      width: SizeConfig.blockSizeHorizontal * 40,
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
                        child: Text("Restart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 5)),
                      ),
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3)),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Question01()),
                        ModalRoute.withName('/question01Page'));
                  },
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
                      width: SizeConfig.blockSizeHorizontal * 40,
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
                        child: Text("Confirm",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 5)),
                      ),
                      padding:
                          EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3)),
                  onPressed: () {
                    createUser();
                  },
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
