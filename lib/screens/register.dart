import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/model/BaseAuth.dart';
import 'package:studdyBuddyScreens/model/user.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:studdyBuddyScreens/sharedWidgets/fullScreenSnackBar.dart';

import 'Login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String initialPassword = null;
  bool _isChecked = false;

  final databaseReference = Firestore.instance;

  @override
  void initState() {
    User.gender = "Male";
    super.initState();
  }

/*Consider implementing google sign in later */

  void createUser() async {
    final status = await AuthController().checkUserExists(User.email);
    /*If new user does not exists in the system */
    if (status == false) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(days: 1),
        content: FullScreenSnackBar(
          icon: Icons.thumb_up,
          genericText: "Hi ${User.firstName}, Please Verify Your Email ",
          inkButtonText: "<- To Login",
          function: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (context) => Login());
            Navigator.of(context)
                .pushReplacement(route)
                .then((value) => _formKey.currentState.reset());
          },
        ),
      ));

      AuthController()
          .signUp(User.email, User.password)
          .then((user) => AuthController().sendEmailVerification())
          .catchError((onError) => print("invalid"));

      databaseReference.collection("MainsUsers").document(User.email).setData({
        'First Name': User.firstName,
        'Last Name': User.lastName,
        "Age": User.age.toString(),
        "Gender": User.gender,
        "City": User.city
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(days: 1),
        backgroundColor: Theme.of(context).errorColor,
        content: FullScreenSnackBar(
            icon: Icons.thumb_down,
            genericText:
                "Hi ${User.firstName}, we are unable to register you because...\n" +
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
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (context) => Register());
              Navigator.of(context).pop(route);
            }),
      ));
    }
  }

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

              //FORM SECTION
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
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
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
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
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
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
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
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
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
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
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
                                      contentPadding: EdgeInsets.only(
                                          left: SizeConfig.safeBlockHorizontal *
                                              6),
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
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
                                  child: DropdownButton(
                                      underline: SizedBox(),
                                      isExpanded: true,
                                      value: User.gender,
                                      hint: Text("Select Gender"),
                                      style: TextStyle(color: Colors.grey),
                                      items: [
                                        DropdownMenuItem(
                                            child: Text("Male"), value: "Male"),
                                        DropdownMenuItem(
                                            child: Text("Female"),
                                            value: "Female"),
                                        DropdownMenuItem(
                                            child: Text("Other"),
                                            value: "Other"),
                                      ],
                                      onChanged: (String value) {
                                        setState(() {
                                          User.gender = value;
                                        });
                                      }),
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
                                  contentPadding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal * 6),
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
                            subtitle: !_isChecked
                                ? Text(
                                    'Required.',
                                    style: TextStyle(color: Colors.red),
                                  )
                                : null,
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
                              print("everything is working " +
                                  "\n ${User.firstName}"
                                      "\n ${User.lastName}"
                                      "\n ${User.password}"
                                      "\n ${User.email}"
                                      "\n ${User.age}"
                                      "\n ${User.gender}"
                                      "\n ${User.city}");
                              createUser();
                            } else {
                              print(
                                  "Make sure to check the terms and conditions");
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
