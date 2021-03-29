import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Home/home.dart';
import 'package:testapp/Home/list.dart';
import 'package:testapp/Home/notification.dart';
import 'package:testapp/Home/profiel.dart';
import 'package:testapp/Home/shope.dart';

import '../style.dart';
import 'feedControler.dart';

class Feed extends StatefulWidget {
  static final String id = 'feed';
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PageController _pageController;
  int curantTab = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  final _widgetFeed = [
    Home(),
    List(),
    Shope(),
    Notifications(),
    Profiel()
  ];
  @override
  Widget build(BuildContext context) {
    var indexprovider = Provider.of<FeedControler>(context, listen: false);
    print('Feedd');
    return Scaffold(
      backgroundColor: Pinter.backG,
        body: _widgetFeed[indexprovider.ind],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 0.0,right: 0.0,bottom: 0.0),
          height: 70,
          decoration: BoxDecoration(
            // color: Color(0xFF181D1F),
            // borderRadius: BorderRadius.circular(18.0),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0))
          ),
          child: BottomNavigationBar(
            currentIndex: indexprovider.ind,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF181D1F),
            selectedItemColor: Pinter.beginL,
            unselectedItemColor: Colors.white,
            iconSize: 20,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.columns),
                // ignore: deprecated_member_use
                title: Text(''),
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.clipboardList),
                title: Text(''),
                backgroundColor: Colors.amber,
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.shoppingBag),
                  title: Text(''),
                  backgroundColor: Colors.yellowAccent),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bell),
                  title: Text(''),
                  backgroundColor: Colors.yellowAccent),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user),
                  title: Text(''),
                  backgroundColor: Colors.yellowAccent),
            ],
            onTap: (index) {
              setState(() {
                indexprovider.changeCounttabe(index);
              });
            },
          ),
        )
        );

  }
}
