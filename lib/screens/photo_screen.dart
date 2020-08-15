import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/res.dart';
import '../widgets/widgets.dart';
import 'feed_screen.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {Key key, this.photo, this.name, this.userName, this.altDescription})
      : super(key: key);

  final String photo;
  final String name;
  final String userName;
  final String altDescription;

  @override
  State createState() {
    return _FullScreenImageState();
  }
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: AppColors.grayChateau),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Feed()));
          },
        ),
        title: Text('Photo', style: AppStyles.h1Black),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Photo(photoLink: widget.photo ?? kFlutterDash),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              widget.altDescription ?? 'This is Flutter dash. I love him <3',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3.copyWith(color: AppColors.manatee),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: _buildPhotoMeta(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LikeButton(likeCount: 23, isLiked: true),
                ButtonBar(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: AppColors.dodgerBlue,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text('Save',
                              style: AppStyles.h4
                                  .copyWith(color: AppColors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: AppColors.dodgerBlue,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text('Visit',
                              style: AppStyles.h4
                                  .copyWith(color: AppColors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoMeta() {
    return Row(
      children: <Widget>[
        UserAvatar(
            'https://pbs.twimg.com/profile_images/1127952848539541504/tu-9u8XA.png'),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.name ?? 'Ivan Gorokhov', style: AppStyles.h1Black),
            Text(widget.userName != null ? '@' + widget.userName : 'CWTeam',
                style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
          ],
        ),
      ],
    );
  }
}
