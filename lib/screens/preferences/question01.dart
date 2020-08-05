import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/screens/preferences/question02.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Question01 extends StatefulWidget {
  @override
  _Question01State createState() => _Question01State();
}

class _Question01State extends State<Question01> {
  static var answers = ['Soda', 'Fruit Juice', 'Coffee', 'Water'];

  int _selectedIndex = null;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
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
        Timer timer = new Timer(new Duration(milliseconds: 500), () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (context) => Question02());
          Navigator.of(context).push(route);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 10),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 5),
                    child: Text(
                      "Tell us about\n" + "yourself?",
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
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 5),
                    child: Text(
                      "What beverage would you prefer\n"
                      "to drink?",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
