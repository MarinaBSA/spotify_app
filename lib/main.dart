import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(App());

/// Main screen
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _appsComponents,
        bottomNavigationBar: _tabBar,
      ),
    );
  }
}

Column _boxColumnGenerator(String imagePath, double boxWidth, String boxTitle,
    {String boxSubtitle}) {
  return Column(
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(imagePath, width: boxWidth, fit: BoxFit.fill),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(boxTitle, style: customTextStyleTitle))
          ],
        ),
      ),
    ],
  );
}

final Widget _settingsBar = Row(
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
final Widget _appsComponents = Container(
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
        _settingsBar,
        //_recentlyPlayedRow,
        _RecentlyPlayedRow(
            rowTitle: "Recently played",
            rowWidth: 400,
            rowHeight: 250,
            boxColumns: _recentlyPlayedBoxColumns),
        _RecentlyPlayedRow(
          rowTitle: "New releases for you",
          rowWidth: 400,
          rowHeight: 300,
          boxColumns: _newReleasesBoxColumns,
        )
      ],
    ));



/// Row with recently played albums
class _RecentlyPlayedRow extends StatelessWidget {
  _RecentlyPlayedRow(
      {this.rowTitle, this.rowWidth, this.rowHeight, this.boxColumns});

  final String rowTitle;
  final double rowWidth;
  final double rowHeight;
  final Widget boxColumns;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Text(rowTitle, style: customTextStyleHeader),
                ],
              )),
          Container(
            width: rowWidth,
            height: rowHeight,
            child: boxColumns,
          ),
        ]),
      ],
    );
  }
}

final Widget _recentlyPlayedBoxColumns = ListView(
  scrollDirection: Axis.horizontal,
  children: <Widget>[
    _boxColumnGenerator("images/album_cover_4.jpg", 185, "Chico Buarque"),
    _boxColumnGenerator("images/album_cover_5.jpg", 185, "Cazuza"),
    _boxColumnGenerator("images/album_cover_6.jpg", 185, "Cássia Eller"),
  ],
);

final Widget _newReleasesBoxColumns = ListView(
  scrollDirection: Axis.horizontal,
  children: <Widget>[
    _boxColumnGenerator("images/album_cover_3.jpg", 225, "The Life Of Pablo"),
    _boxColumnGenerator("images/album_cover_2.jpg", 225, "Take Care"),
    _boxColumnGenerator("images/album_cover_1.png", 225, "Trilogy"),
  ],
);

/// Bottom Navigation Bar
final Widget _tabBar = BottomNavigationBar(
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
