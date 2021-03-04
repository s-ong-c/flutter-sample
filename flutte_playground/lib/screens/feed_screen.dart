import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playgroundI/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CupertinoNavigationBar(
         leading: IconButton(
           icon: Icon(CupertinoIcons.camera),
           onPressed: null,
         ),
         middle:Text(
           '오늘의 온도',
           style: TextStyle(fontFamily: 'NanumSquareRound',),
         ),
         trailing: Row(
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[
             IconButton(
                onPressed: null,
                icon: ImageIcon(
                        AssetImage('assets/images/logo1.png'),
                        color: Colors.red,
                ),
             ),
           ],
         ),
       ),
      body: ListView.builder(itemBuilder: feedListBuilder, itemCount: 30,),
    );
  }

  Widget feedListBuilder(BuildContext context, int index){
    return Post(index);
  }
}


