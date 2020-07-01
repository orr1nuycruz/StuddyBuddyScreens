import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 75, 0, 50),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Material(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(80.0)),
                  elevation: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: new Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Add a Profile Picture",
                style: TextStyle(
                  fontFamily: 'Open-Sans',
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
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
                            height: 45,
                            width: 350,
                            child: TextField(
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
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: 45,
                            width: 350,
                            child: TextField(
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
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: 45,
                            width: 350,
                            child: TextField(
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
                                  hintText: "Email Address"),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: 45,
                            width: 350,
                            child: TextField(
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
                                  hintText: "Password"),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: 45,
                            width: 350,
                            child: TextField(
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
                                  hintText: "Confirm Password"),
                            ),
                          ),
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
    );
  }
}
