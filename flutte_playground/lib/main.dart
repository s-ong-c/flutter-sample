import 'package:flutter/material.dart';
import 'package:playgroundI/constants/colors.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

// StatelessWidget 상태 변화가 없다.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      //     home: HomePage(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}
