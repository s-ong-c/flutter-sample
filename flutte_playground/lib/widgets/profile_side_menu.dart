import 'package:flutter/material.dart';
import 'package:playgroundI/screens/auth_screen.dart';

class ProfileSideMenu extends StatelessWidget {
  final double menuWidth;

  const ProfileSideMenu(this.menuWidth, {Key key, h}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumSquareRound',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black87),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AuthScreen(),
                ));
              },
              title: Text(
                'Sign out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NanumSquareRound',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
