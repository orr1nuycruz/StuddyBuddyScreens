import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 75, 0, 50),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Material(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                    elevation: 3,
                    child: Container(
                      width: 225,
                      height: 40,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          prefixIcon: Icon(Icons.search),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(25.0),
                            ),
                          ),
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                onTap: () {},
                child: Material(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(80.0)),
                  elevation: 5,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: new Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
