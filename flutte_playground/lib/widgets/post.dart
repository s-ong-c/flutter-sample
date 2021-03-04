import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:playgroundI/constants/common_size.dart';
import 'package:playgroundI/constants/screen_size.dart';
import 'package:playgroundI/widgets/comment.dart';
import 'package:playgroundI/widgets/rounded_avartar.dart';

import 'my_progress_indicator.dart';

class Post extends StatelessWidget {
  final int index;

  Post(
    this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption()
      ],
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Comment(
        showImage: false,
        username: 'songc',
        text: '안녕하',
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        '12000 likes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: <Widget>[
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/bookmark.png')),
            color: Colors.black87,
            onPressed: null),
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/comment.png')),
            color: Colors.black87,
            onPressed: null),
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/direct_message.png')),
            color: Colors.black87,
            onPressed: null),
        Spacer(),
        IconButton(
            icon: ImageIcon(AssetImage('assets/images/heart_selected.png')),
            color: Colors.black87,
            onPressed: null),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('@ONGC')),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
        )
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      placeholder: (BuildContext context, String url) {
        return MyProgressIndicator(progressSize: size.width);
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 2,
          child: Container(
              decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          )),
        );
      },
    );
  }
}
