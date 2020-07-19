import 'dart:convert';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/model/user.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:studdyBuddyScreens/sharedWidgets/fullScreenSnackBar.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';
  String initialPassword = null;
  bool _isChecked = false;

  final databaseReference = Firestore.instance;

/*Consider implementing google sign in later */

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.fromLTRB(0, SizeConfig.safeBlockVertical * 2, 0,
            SizeConfig.safeBlockVertical * 3),
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
              SizedBox(height: SizeConfig.safeBlockVertical * 1),
              Text(
                "Add a Profile Picture",
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 1),
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
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "First Name"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Cannot be empty";
                                } else {
                                  setState(() {
                                    User.firstName = value;
                                  });
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "Last Name"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Cannot be empty";
                                } else {
                                  setState(() {
                                    User.lastName = value;
                                  });
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "Email Address"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Cannot be empty";
                                } else if (!isValidEmail(value)) {
                                  return "Invalid Email";
                                } else {
                                  setState(() {
                                    User.email = value;
                                  });
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "Password"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                                if (value.length <= 6) {
                                  return 'Password must be greater than 6 characters';
                                }
                                setState(() {
                                  initialPassword = value;
                                });
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "Confirm Password"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                } else if (value != initialPassword) {
                                  return 'Password does not match';
                                } else {
                                  setState(() {
                                    User.password = value;
                                  });
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
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
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: new InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      border: new OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        ),
                                      ),
                                      hintText: "Age"),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Cannot be empty";
                                    } else {
                                      setState(() {
                                        User.age = int.parse(value);
                                      });
                                      return null;
                                    }
                                  },
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
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  decoration: new InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      border: new OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(30.0),
                                        ),
                                      ),
                                      hintText: "Gender"),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Cannot be empty";
                                    } else {
                                      setState(() {
                                        User.gender = value;
                                      });
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 85,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: new InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "Enter City"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Cannot be empty";
                                } else {
                                  setState(() {
                                    User.city = value;
                                  });
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical * 7.2,
                          width: SizeConfig.blockSizeHorizontal * 85,
                          child: CheckboxListTile(
                            title: Text("I have read the terms and conditions",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.5,
                                )),
                            value: _isChecked,
                            onChanged: (val) {
                              setState(() {
                                _isChecked = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 1),
                        RaisedButton(
                          padding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
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
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text("REGISTER",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                5)),
                              ),
                              padding: EdgeInsets.all(
                                  SizeConfig.safeBlockHorizontal * 3)),
                          onPressed: () {
                            if (this._formKey.currentState.validate() &&
                                _isChecked) {
                              print("everything is working");
                            } else {
                              print(
                                  "MAke sure to check the terms and conditions");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
}
