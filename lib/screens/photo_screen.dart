import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/res.dart';
import '../widgets/widgets.dart';

class FullScreenImage extends StatefulWidget {
  String photo;
  String name;
  String userName;
  String altDescription;
  String userPhoto;
  String heroTag;

  FullScreenImage(
      {Key key, photo, name, userName, userPhoto, heroTag, altDescription})
      : super(key: key) {
    this.heroTag = heroTag;
    this.userName = userName ?? 'CWTeam';
    this.name = name ?? 'Ivan Gorokhov';
    this.altDescription = altDescription ?? 'Coming Soon...';
    this.photo = photo ??
        'https://pbs.twimg.com/profile_images/1127952848539541504/tu-9u8XA.png';
    this.userPhoto = userPhoto ??
        'https://pbs.twimg.com/profile_images/1127952848539541504/tu-9u8XA.png';
  }

  @override
  State createState() {
    return _FullScreenImageState();
  }
}

class _FullScreenImageState extends State<FullScreenImage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _playAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photo'),
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.heroTag,
              child: Photo(photoLink: widget.photo),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                widget.altDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.h3,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Opacity(
                        opacity: buildAnimationUserAvatar(),
                        child: UserAvatar(
                            'https://skill-branch.ru/img/speakers/Adechenko.jpg'),
                      ),
                      SizedBox(width: 6.0),
                      Opacity(
                        opacity: buildAnimationUserMeta(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.name, style: AppStyles.h1Black),
                            Text(
                              '@' + widget.userName,
                              style: AppStyles.h5Black
                                  .copyWith(color: AppColors.manatee),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LikeButton(likeCount: 10, isLiked: true),
                  Row(
                    children: <Widget>[
                      _buildButton(txt: 'Save'),
                      SizedBox(width: 10),
                      _buildButton(txt: 'Visit'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double buildAnimationUserMeta() {
    return Tween<double>(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1.0, curve: Curves.ease),
          ),
        )
        .value;
  }

  double buildAnimationUserAvatar() {
    return Tween<double>(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.5, curve: Curves.ease),
          ),
        )
        .value;
  }

  Widget _buildButton({String txt = 'Button'}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.dodgerBlue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Text(txt, style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
