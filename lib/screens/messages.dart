import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:studdyBuddyScreens/model/user.dart';
import 'package:studdyBuddyScreens/sharedWidgets/mascotImage.dart';
import 'package:hexcolor/hexcolor.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final List<User> getUsers = User.userList();

  Widget userCard(User user, BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(),
        width: 500,
        height: 100.0,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Material(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(80.0)),
                    elevation: 5,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(user.image),
                      backgroundColor: Colors.white,
                      radius: 32,
                      
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 155,
                        child: new Text(
                          user.firstName + " " + user.lastName,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        child: new Text(
                          "Insert message here",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.video_call, color: Colors.blue,),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.call, color: Colors.blue,),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

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
                      width: 255,
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
                        radius: 32,
                        child: new Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Expanded(
                child: ListView.builder(
                    itemCount: getUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return userCard(getUsers[index], context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
