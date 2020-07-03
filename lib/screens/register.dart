import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.fromLTRB(0,
            SizeConfig.safeBlockVertical * 2,0,0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Material(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(80.0)),
                    elevation: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: SizeConfig.blockSizeHorizontal * 13,
                      child: new Icon(
                        Icons.person,
                        size: SizeConfig.blockSizeHorizontal * 10,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1),
                Text(
                  "Add a Profile Picture",
                  style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1),
                Form(
                  key: _formKey,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Material(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: "First Name"),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Material(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: "Last Name"),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Material(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: "Email Address"),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Material(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: "Password"),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Material(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: "Confirm Password"),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Material(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                elevation: 3,
                                child: Container(
                                  height: SizeConfig.blockSizeVertical * 5,
                                  width: SizeConfig.blockSizeHorizontal * 38,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: new InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                25, 0, 0, 0),
                                        border: new OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          ),
                                        ),
                                        hintText: "Age"),
                                  ),
                                ),
                              ),
                              Material(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                elevation: 3,
                                child: Container(
                                  height: SizeConfig.blockSizeVertical * 5,
                                  width: SizeConfig.blockSizeHorizontal * 38,
                                  child: TextField(
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                25, 0, 0, 0),
                                        border: new OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          ),
                                        ),
                                        hintText: "Gender"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          Material(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 5,
                              width: SizeConfig.blockSizeHorizontal * 85,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                    border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(30.0),
                                      ),
                                    ),
                                    hintText: "Select City"),
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 1),
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: CheckboxListTile(
                              title: Text("I have read the terms and condition",
                                  style: TextStyle(color: Colors.grey)),
                              value: _isChecked,
                              onChanged: (val) {
                                setState(() {
                                  _isChecked = val;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2),
                          RaisedButton(
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.white),
                            ),
                            child: Container(
                                width: 150,
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
                                  child: Text("REGISTER",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                                padding: const EdgeInsets.all(15.0)),
                            onPressed: null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
