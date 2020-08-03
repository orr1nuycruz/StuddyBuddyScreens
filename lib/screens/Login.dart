import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studdyBuddyScreens/model/BaseAuth.dart';
import 'package:studdyBuddyScreens/model/user.dart';
import 'package:studdyBuddyScreens/screens/register.dart';
import 'package:studdyBuddyScreens/sharedWidgets/fullScreenSnackBar.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  void signInUser(String email, String password) async {
    int lastIndex = email.indexOf("@");
    String compressedEmail = email.substring(0, lastIndex);

    //Sign in
    try {
      await AuthController().signIn(email, password);
    } on PlatformException catch (e) {
      switch (e.code) {
        case "ERROR_WRONG_PASSWORD":
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            duration: Duration(days: 1),
            backgroundColor: Theme.of(context).errorColor,
            content: FullScreenSnackBar(
              icon: Icons.thumb_down,
              isExpanded: true,
              genericText:
                  "Hi $compressedEmail, we are unable to log you in because...\n" +
                      "\n-Wrong Password",
              inkButtonText: "<- Back To Login",
              function: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Login());
                Navigator.of(context).pushReplacement(route);
                _scaffoldKey.currentState.hideCurrentSnackBar();
              },
            ),
          ));
          return print("ERROR_WRONG_PASSWORD");
          break;

        case "ERROR_USER_NOT_FOUND":
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            duration: Duration(days: 1),
            backgroundColor: Theme.of(context).errorColor,
            content: FullScreenSnackBar(
              icon: Icons.thumb_down,
              isExpanded: true,
              genericText:
                  "Hi $compressedEmail, we are unable to log you in because...\n" +
                      "\n-User does not exist",
              inkButtonText: "<- Back To Login",
              function: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Login());
                Navigator.of(context).pushReplacement(route);
              },
              inkButtonText2: "<- To Register",
              function2: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Register());
                Navigator.of(context).push(route);
              },
            ),
          ));
          return print("ERROR_USER_NOT_FOUND");
          break;

        case "ERROR_NETWORK_REQUEST":
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            duration: Duration(days: 1),
            backgroundColor: Theme.of(context).errorColor,
            content: FullScreenSnackBar(
              icon: Icons.signal_wifi_off,
              isExpanded: true,
              genericText:
                  "Hi $compressedEmail, we are unable to log you in because...\n" +
                      "\n-Poor Connection",
              inkButtonText: "<- Back To Login",
              function: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Login());
                Navigator.of(context).pushReplacement(route);
                _scaffoldKey.currentState.hideCurrentSnackBar();
              },
            ),
          ));
          return print("ERROR_NETWORK_REQUEST");
          break;
        default:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            duration: Duration(days: 1),
            backgroundColor: Theme.of(context).errorColor,
            content: FullScreenSnackBar(
                icon: Icons.do_not_disturb,
                genericText:
                    "Hi $compressedEmail, we are unable to Log you in for unknown reasons...\n" +
                        "\n-Please contact an Admin @ jnguessa@uoguelph.ca",
                inkButtonText: "<- Back To Login",
                function: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => Login());
                  Navigator.of(context).pushReplacement(route);
                  _scaffoldKey.currentState.hideCurrentSnackBar();
                },
                inkButtonText2: "<- Back to Register",
                function2: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => Register());
                  Navigator.of(context).push(route);
                }),
          ));

          return print("Unknown reason");
          break;
      }
    }
    /*At this point, the user is has the correct credential
    Logged in, but can't see content
    */
    AuthController().getCurrentUser().then((firebaseUser) {
      switch (firebaseUser.isEmailVerified) {
        case true:
          /*Go to calendar screen */
          _scaffoldKey.currentState.showSnackBar(SnackBar(
              duration: Duration(days: 1),
              backgroundColor: Colors.green,
              content: FullScreenSnackBar(
                  icon: Icons.do_not_disturb,
                  genericText:
                      "This account exists, which means that login functionality is working properly",
                  inkButtonText: "<- Back To Login",
                  function: () {
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (context) => Login());
                    Navigator.of(context).pushReplacement(route);
                    _formKey.currentState.reset();
                  })));

          break;
        case false:
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            duration: Duration(days: 1),
            content: FullScreenSnackBar(
              icon: Icons.thumb_up,
              genericText: "Hi $compressedEmail, Please Verify Your Email ",
              inkButtonText: "<- To Login",
              function: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => Login());
                Navigator.of(context).pushReplacement(route);
              },
            ),
          ));
          break;
      }
    });
  }

  User user = new User();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 0,
            SizeConfig.safeBlockVertical * 3,
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockSizeVertical * 20),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 7.2,
                              width: SizeConfig.blockSizeHorizontal * 72,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      SizeConfig.safeBlockHorizontal * 4,
                                      SizeConfig.safeBlockVertical * 3,
                                      0,
                                      SizeConfig.safeBlockVertical * 2),
                                  border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.blockSizeVertical * 20),
                                    ),
                                  ),
                                  hintText: "example@email.com",
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Cannot be empty";
                                  } else if (!isValidEmail(value)) {
                                    return 'Invalid Email';
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
                          SizedBox(height: SizeConfig.blockSizeVertical * 1.5),
                          Material(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockSizeVertical * 20),
                            ),
                            elevation: 3,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 7.2,
                              width: SizeConfig.blockSizeHorizontal * 72,
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        SizeConfig.safeBlockHorizontal * 4,
                                        SizeConfig.safeBlockVertical * 3,
                                        0,
                                        SizeConfig.safeBlockVertical * 2),
                                    border: new OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            SizeConfig.blockSizeVertical * 20),
                                      ),
                                    ),
                                    hintText: "*******"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  } else {
                                    setState(() {
                                      User.password = value;
                                    });
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical * 2.5),
                          RaisedButton(
                            padding: const EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    SizeConfig.blockSizeVertical * 20),
                              ),
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        SizeConfig.blockSizeVertical * 20),
                                  ),
                                ),
                                child: Center(
                                  child: Text("Sign in",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                                padding: EdgeInsets.all(
                                    SizeConfig.safeBlockHorizontal * 3.5)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                signInUser(User.email, User.password);
                              } else {
                                print("Not Valid");
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 3.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: new TextStyle(color: Colors.grey),
                    ),
                    new InkWell(
                      onTap: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (context) => Register());
                        Navigator.of(context).push(route);
                      },
                      child: new Padding(
                        padding: new EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 1),
                        child: new Text("Register Now!",
                            style: new TextStyle(color: Colors.blue)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
}
