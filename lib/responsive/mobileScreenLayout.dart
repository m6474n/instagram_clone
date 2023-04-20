import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:instagram_clone/screens/login/login_screen.dart';
import 'package:instagram_clone/screens/tabs/home_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);


  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
   HomeScreen(),
    Center(child: Text('Explore')),
    Center(child: Text('Add Post')),
    Center(child: Text('Reels')),
    Center(child: Text('Profile')),

  ];

  void onItemTapped(int index){
setState(() {
  selectedIndex = index;

});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Image(
            image: AssetImage('assets/logo-1.png'),
            color: Colors.white,
            height: 40,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.chat_bubble)),
          ],
        ),
      body: _widgetOptions.elementAt(selectedIndex),
            bottomNavigationBar: GNav(
              onTabChange: onItemTapped,
              selectedIndex: selectedIndex,
              tabs: [
                GButton(icon: FontAwesomeIcons.house),
                GButton(icon: FontAwesomeIcons.magnifyingGlass),
                GButton(icon: FontAwesomeIcons.solidSquarePlus),
                GButton(icon: FontAwesomeIcons.circlePlay),
                GButton(icon: FontAwesomeIcons.user),
              ],
            ),


        );
  }
}
