import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(App());

/// Main screen
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: appsComponents,
        bottomNavigationBar: tabBar,
      ),
    );
  }
}

final Widget settingsBar = Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    Container(
      margin: EdgeInsets.all(15),
      child: IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
            size: 30,
          ),
          onPressed: null),
    )
  ],
);

/// App's Components
final Widget appsComponents = Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(Colors.deepPurpleAccent[400].hashCode),
          Color(Colors.black.hashCode)
        ],
        begin: Alignment.topLeft,
        end: new Alignment(-0.35, -0.25),
      ),
    ),
    child: ListView(
      children: <Widget>[
        settingsBar,
        recentlyPlayedRow,
      ],
    ));

final Widget recentlyPlayedRow = Row(
  children: <Widget>[
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
          margin: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Text("Recently played", style: customTextStyleHeader),
            ],
          )),
      Container(
        width: 400,
        height: 400,
        child: recentlyPlayedSongCards,
      ),
    ]),
  ],
);

final Widget recentlyPlayedSongCards = ListView(
  scrollDirection: Axis.horizontal,
  children: <Widget>[
    Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("images/album_cover_1.png",
                  width: 185, fit: BoxFit.fill),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("Trilogy", style: customTextStyleTitle))
            ],
          ),
        ),
      ],
    ),
    Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("images/album_cover_2.jpg",
                  width: 185, fit: BoxFit.fill),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("Take Care", style: customTextStyleTitle))
            ],
          ),
        ),
      ],
    ),
    Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("images/album_cover_3.jpg",
                  width: 185, fit: BoxFit.fill),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("The Life Of Pablo", style: customTextStyleTitle))
            ],
          ),
        ),
      ],
    )
  ],
);

/// Bottom Navigation Bar
final Widget tabBar = BottomNavigationBar(
  backgroundColor: Colors.grey[900],
  currentIndex: 0,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.white, size: 45),
      title: Text(
        "Home",
        style: customTextStyleIcon,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search, color: Colors.white, size: 45),
      title: Text(
        "Search",
        style: customTextStyleIcon,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.playlist_play, color: Colors.white, size: 45),
      title: Text(
        "Your Library",
        style: customTextStyleIcon,
      ),
    )
  ],
);

/// TextStyles
final TextStyle customTextStyleHeader =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);

final TextStyle customTextStyleTitle = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

final TextStyle customTextStyleIcon = TextStyle(
  color: Colors.white,
  fontSize: 15,
);
