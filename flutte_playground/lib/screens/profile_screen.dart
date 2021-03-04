import 'package:flutter/material.dart';
import 'package:playgroundI/constants/screen_size.dart';
import 'package:playgroundI/widgets/profile_body.dart';
import 'package:playgroundI/widgets/profile_side_menu.dart';

const duration = Duration(milliseconds: 1000);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final menuWidth = size.width / 3 * 2;
  MenuStatus _menuStatus = MenuStatus.closed;
  double menuXPos = size.width;
  double bodyXPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            child: ProfileBody(onMenuChanged: () {
              setState(() {
                _menuStatus = (_menuStatus == MenuStatus.closed)
                    ? MenuStatus.open
                    : MenuStatus.closed;
                switch (_menuStatus) {
                  case MenuStatus.open:
                    bodyXPos = -menuWidth;
                    menuXPos = size.width - menuWidth;
                    break;
                  case MenuStatus.closed:
                    bodyXPos = 0;
                    menuXPos = size.width;
                    break;
                }
              });
            }),
            transform: Matrix4.translationValues(bodyXPos, 0, 0),
          ),
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(menuXPos, 0, 0),
            child: ProfileSideMenu(menuWidth),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus { open, closed }
