import 'package:flutter/material.dart';
import '../res/res.dart';
import '../widgets/widgets.dart';
import 'photo_screen.dart';

const String kFlutterDash =
    'https://blog.codemagic.io/uploads/2020/01/dashmascot.jpg';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  State createState() {
    return _FeedState();
  }
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                _buildItem(index),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                )
              ],
            );
          }),
    );
  }

  Widget _buildItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        FullScreenImage(photo: kFlutterDash)));
          },
          child: Photo(photoLink: kFlutterDash),
        ),
        _buildPhotoMeta(index),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'This is Flutter dash. I love him <3',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.manatee),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoMeta(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar(
                  'https://pbs.twimg.com/profile_images/1127952848539541504/tu-9u8XA.png'),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Ivan Gorokhov', style: AppStyles.h2Black),
                  Text('CWTeam',
                      style:
                          AppStyles.h5Black.copyWith(color: AppColors.manatee)),
                ],
              ),
            ],
          ),
          LikeButton(likeCount: 23, isLiked: true)
        ],
      ),
    );
  }
}
