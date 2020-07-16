import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 5,
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 5),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MascotImage(size: SizeConfig.blockSizeHorizontal * 50),
              Text(
                "Greetings!",
                style: TextStyle(
                    fontFamily: 'Open-Sans',
                    fontSize: SizeConfig.safeBlockHorizontal * 10.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 4.5),
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
                            height: SizeConfig.blockSizeVertical * 7.2,
                            width: SizeConfig.blockSizeHorizontal * 72,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(
                                    SizeConfig.safeBlockHorizontal * 4,
                                    SizeConfig.safeBlockVertical * 3,
                                    0,
                                    SizeConfig.safeBlockVertical * 2),
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30.0),
                                  ),
                                ),
                                hintText: "example@email.com",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
                        Material(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                          elevation: 3,
                          child: Container(
                            height: SizeConfig.blockSizeVertical * 7.2,
                            width: SizeConfig.blockSizeHorizontal * 72,
                            child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      SizeConfig.safeBlockHorizontal * 4,
                                      SizeConfig.safeBlockVertical * 3,
                                      0,
                                      SizeConfig.safeBlockVertical * 2),
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(30.0),
                                    ),
                                  ),
                                  hintText: "*******"),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                        RaisedButton(
                          padding: const EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            side: BorderSide(color: Colors.white),
                          ),
                          child: Container(
                              width: SizeConfig.blockSizeHorizontal * 35,
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
              SizedBox(height: SizeConfig.blockSizeVertical * 3.0),
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
        )),
      ),
    );
  }
}
