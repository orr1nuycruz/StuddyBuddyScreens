import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studdyBuddyScreens/screens/preferences/question02.dart';
import 'package:studdyBuddyScreens/screens/preferences/question04.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Question03 extends StatefulWidget {
  @override
  _Question03State createState() => _Question03State();
}

class _Question03State extends State<Question03> with TickerProviderStateMixin {
  static var answers = [
    'High School',
    'College',
    'University',
    'Prefer not to say'
  ];

  String strAnswer;
  int _selectedIndex = null;
  List<String> list = new List();

  AnimationController controller;
  Animation<double> animation;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  void getAnswer03(var obj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('answer03', obj);
  }

  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => list = prefs.getStringList('userInfo') ?? null);
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Widget userCard(var obj, int index, BuildContext context) {
    return InkWell(
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 10,
        height: SizeConfig.blockSizeVertical * 10,
        child: Card(
          color: _selectedIndex != null && _selectedIndex == index
              ? Colors.blue
              : Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 1,
                bottom: SizeConfig.safeBlockVertical * 2,
                left: SizeConfig.safeBlockHorizontal * 9),
            child: Row(
              children: <Widget>[
                Container(
                  color: _selectedIndex != null && _selectedIndex == index
                      ? Colors.blue
                      : Colors.white,
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 50,
                        child: new Text(
                          obj,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Open-Sans',
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() => _onSelected(index));
        print(obj);
        getAnswer03(obj);
        Timer timer = new Timer(new Duration(milliseconds: 200), () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return Question04();
              },
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 10,
            bottom: SizeConfig.safeBlockVertical * 10),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 5),
                    child: Text(
                      "Tell us about\n" + "yourself? \n" + list[1],
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 8,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: SizeConfig.blockSizeHorizontal * .25),
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(
                              SizeConfig.blockSizeHorizontal * 2),
                          bottomLeft: Radius.circular(
                              SizeConfig.blockSizeHorizontal * 2)),
                      color: Colors.purple[100],
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: SizeConfig.blockSizeHorizontal * .25),
                      color: Colors.purple[100],
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: SizeConfig.blockSizeHorizontal * .25),
                      color: Colors.white,
                    ),
                    child: FadeTransition(
                      opacity: animation,
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 20,
                        height: SizeConfig.blockSizeVertical * 1,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.purple[100],
                              width: SizeConfig.blockSizeHorizontal * .25),
                          color: Colors.purple[100],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: SizeConfig.blockSizeHorizontal * .25),
                      borderRadius: new BorderRadius.only(
                          topRight: Radius.circular(
                              SizeConfig.blockSizeHorizontal * 2),
                          bottomRight: Radius.circular(
                              SizeConfig.blockSizeHorizontal * 2)),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal * 5,
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 5),
                    child: Text(
                      "What is your highest education \nattained? \n",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              new Expanded(
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (BuildContext _, int i) {
                    return userCard(answers[i], i, context);
                  },
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
                      child: Text("Go Back",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 5)),
                    ),
                    padding:
                        EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Question02();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
