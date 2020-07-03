import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:studdyBuddyScreens/screens/Login.dart';
import 'package:studdyBuddyScreens/screens/intro.dart';
import 'package:studdyBuddyScreens/screens/maintenance.dart';
import 'package:studdyBuddyScreens/screens/messages.dart';
import 'package:studdyBuddyScreens/screens/register.dart';
import 'package:studdyBuddyScreens/sharedWidgets/sizeConfig.dart';

class BottomNavigatorPage extends StatefulWidget {
  @override
  _BottomNavigatorPageState createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    IntroPage(),
    Login(),
    Register(),
    Maintenance(),
    MessageList()
  ];

  void SelectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    return new Scaffold(
      
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.purple,
            ),
            title: Text(
              'Intro',
              style: TextStyle(color: Colors.purple),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud,
              color: Colors.purple,),
            title: Text('Login',
              style: TextStyle(color: Colors.purple),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud,
              color: Colors.purple,),
            title: Text('Registration',
              style: TextStyle(color: Colors.purple),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud,
              color: Colors.purple,),
            title: Text('Messages',
              style: TextStyle(color: Colors.purple),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud,
              color: Colors.purple,),
            title: Text('Friends',
              style: TextStyle(color: Colors.purple),),
          ),
        ],
        onTap: SelectPage,
        currentIndex: _currentIndex,
      ),
    );
  }
}
