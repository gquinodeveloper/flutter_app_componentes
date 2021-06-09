import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Avatar'),
        actions: [
          CircleAvatar(
            child: ClipOval(
              child: Image(
                image: NetworkImage(
                  'https://i.pinimg.com/474x/68/fd/06/68fd065139db9e77b7d38e39e6d620cf.jpg',
                ),
              ),
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/474x/75/c0/ed/75c0ed20fdd7b4bd42976cd270fcab6a.jpg',
            ),
          ),
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/474x/c1/6e/60/c16e60b8feb0ce6512f795c7c5c155ad.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset(
              'assets/jar-loading.gif',
              //width: 100.0,
              //height: 100.0,
            ),
          ),
          SizedBox(height: 100.0),
          Image(
            width: 200.0,
            height: 200.0,
            image: AssetImage('assets/jar-loading.gif'),
          )
        ],
      ),
    );
  }
}
