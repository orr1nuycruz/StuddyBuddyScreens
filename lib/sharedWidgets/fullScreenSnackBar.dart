import 'package:flutter/material.dart';

class FullScreenSnackBar extends StatelessWidget {
  final IconData icon;
  final String inkButtonText;
  final String inkButtonText2;
  final String genericText;
  //Expands Text (Made due to differences between login + register)
  final bool isExpanded;

  final Function function;
  final Function function2;

  FullScreenSnackBar(
      {this.icon,
      this.inkButtonText,
      this.inkButtonText2,
      this.isExpanded,
      this.genericText,
      this.function,
      this.function2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*Consider making it clickable to mail */
          Icon(
            icon,
            size: 100,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: isExpanded == true
                    ? Expanded(
                        child: Text(
                          genericText,
                        ),
                      )
                    : Text(genericText),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          inkButtonText != null
              ? InkWell(
                  child: Text(
                    inkButtonText,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: function)
              : Text(""),
          SizedBox(
            height: 10,
          ),
          inkButtonText2 != null
              ? InkWell(
                  child: Text(
                    inkButtonText2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: function2)
              : Text(""),
        ],
      ),
    );
  }
}
