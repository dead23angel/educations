import 'package:flutter/material.dart';

import '../app.dart';
import '../res/res.dart';
import '../widgets/widgets.dart';
import 'photo_screen.dart';

const String kFlutterDash =
    'https://blog.codemagic.io/uploads/2020/01/dashmascot.jpg';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
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
              _buildItem(index, context, transition),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem(int index, context, transition) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _transitionPhotoScreen(context, index, transition);
          },
          child: Hero(
            tag: 'Index $index',
            child: Photo(photoLink: kFlutterDash),
          ),
        ),
        _buildPhotoMeta(index),
        Divider(thickness: 2, color: AppColors.mercury)
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
                  Text(
                    "CWTeam",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: AppColors.manatee),
                  ),
                  Text(
                    'This is Flutter dash. I love him :',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: AppColors.manatee),
                  ),
                ],
              )
            ],
          ),
          LikeButton(likeCount: 10, isLiked: true),
        ],
      ),
    );
  }
}

void _transitionPhotoScreen(context, index, transition) {
  Navigator.pushNamed(
    context,
    transition,
    arguments: FullScreenImageArguments(
      routeSettings: RouteSettings(
        arguments: 'Some title',
      ),
      photo: kFlutterDash,
      altDescription: 'Test altDescription',
      userName: 'CWTeam',
      name: 'Ivan Gorokhov',
      userPhoto:
          'https://pbs.twimg.com/profile_images/1127952848539541504/tu-9u8XA.png',
      heroTag: 'Index $index',
    ),
  );
}
