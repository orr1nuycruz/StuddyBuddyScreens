import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Question02 extends StatefulWidget {
  @override
  _Question02State createState() => _Question02State();
  Function function;
  Question02({this.function});
}

class _Question02State extends State<Question02> with TickerProviderStateMixin {
  static var answers = [
    'For School',
    'Self-Growth',
    'Meeting Peers',
    'Just Curious'
  ];
  int _selectedIndex = null;

  AnimationController controller;
  Animation<double> animation;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();
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
        Timer timer = new Timer(new Duration(milliseconds: 500), () {
          print(obj);
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
                      color: Colors.white,
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
                      "What is your reason for using \nthis app?",
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
