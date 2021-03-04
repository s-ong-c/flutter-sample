import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:playgroundI/constants/common_size.dart';
import 'package:playgroundI/constants/screen_size.dart';
import 'package:playgroundI/screens/profile_screen.dart';
import 'package:playgroundI/widgets/rounded_avartar.dart';

class ProfileBody extends StatefulWidget {
  final Function() onMenuChanged;

  const ProfileBody({Key key, this.onMenuChanged}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  double _leftImagePageMargin = 0;
  double _rightImagePageMargin = size.width;

  AnimationController _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController =
        AnimationController(vsync: this, duration: duration);
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _appbar(),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(common_gap),
                          child: RoundedAvatar(
                            size: 80,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: common_gap),
                            child: Table(
                              children: [
                                TableRow(children: [
                                  _valueText('146'),
                                  _valueText('146'),
                                  _valueText('146'),
                                ]),
                                TableRow(children: [
                                  _labelText('Post'),
                                  _labelText('Follower'),
                                  _labelText('Follwing'),
                                ])
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    _username(),
                    _userBio(),
                    _editProfileBtn(),
                    _tabButtons(),
                    _selectedIndicator()
                  ]),
                ),
                _imagePager()
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _appbar() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 44,
        ),
        Expanded(
          child: Text(
            'SONGC',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NanumSquareRound',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _iconAnimationController,
            ),
            onPressed: () {
              widget.onMenuChanged();
              _iconAnimationController.status == AnimationStatus.completed
                  ? _iconAnimationController.reverse()
                  : _iconAnimationController.forward();
            })
      ],
    );
  }

  Text _valueText(String value) =>
      Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'NanumSquareRound',
        ),
      );

  Text _labelText(String value) =>
      Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontFamily: 'NanumSquareRound',
          fontSize: 12,
        ),
      );

  SliverToBoxAdapter _imagePager() {
    return SliverToBoxAdapter(
        child: Stack(children: <Widget>[
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(_leftImagePageMargin, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: _images(),
          ),
          AnimatedContainer(
            duration: duration,
            transform: Matrix4.translationValues(_rightImagePageMargin, 0, 0),
            curve: Curves.fastOutSlowIn,
            child: _images(),
          )
        ]));
  }

  Padding _images() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        //상위 스크롤 체스처만 허용
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: List.generate(
          30,
              (index) =>
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "https://picsum.photos/id/$index/200/200",
              ),
        ),
      ),
    );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: duration,
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: size.width / 2,
        color: Colors.grey[400],
      ),
      curve: Curves.bounceOut,
    );
  }

  Row _tabButtons() {
    return Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround, 1 방법
      children: <Widget>[
        Expanded(
          // 2 방법
          child: IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/grid.png'),
                color: _selectedTab == SelectedTab.left
                    ? Colors.black
                    : Colors.black26,
              ),
              onPressed: () {
                _tabSelected(SelectedTab.left);
              }),
        ),
        Expanded(
            child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/images/saved.png'),
                  color: _selectedTab == SelectedTab.right
                      ? Colors.black
                      : Colors.black26,
                ),
                onPressed: () {
                  _tabSelected(SelectedTab.right);
                }))
      ],
    );
  }

  _tabSelected(SelectedTab selectedTab) {
    setState(() {
      switch (selectedTab) {
        case SelectedTab.left:
          _selectedTab = SelectedTab.left;
          _leftImagePageMargin = 0;
          _rightImagePageMargin = size.width;
          break;
        case SelectedTab.right:
          _selectedTab = SelectedTab.right;
          _leftImagePageMargin = -size.width;
          _rightImagePageMargin = 0;
          break;
      }
    });
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: null,
          borderSide: BorderSide(color: Colors.black45),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'NanumSquareRound',
        ),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'this is what I believe',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: 'NanumSquareRound',
        ),
      ),
    );
  }
}

enum SelectedTab { left, right }
