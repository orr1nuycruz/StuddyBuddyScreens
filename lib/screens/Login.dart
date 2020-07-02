import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 75, 0, 50),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              MascotImage(size: 250),
              Text(
                "Greetings!",
                style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 35),
              Form(
                key: _formKey,
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(25.0),
                          ),
                          elevation: 3,
                          child: Container(
                            width: 300,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  hintText: "example@email.com"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(25.0),
                          ),
                          elevation: 3,
                          child: Container(
                            width: 300,
                            child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  hintText: "*******"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
                                child: Text("Sign in",
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
              SizedBox(height: 20),
              RichText(
                text: new TextSpan(children: [
                  new TextSpan(
                    text: "Don't have an account? ",
                    style: new TextStyle(color: Colors.grey),
                  ),
                  new TextSpan(
                      text: "Register Now!",
                      style: new TextStyle(color: Colors.blue))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
