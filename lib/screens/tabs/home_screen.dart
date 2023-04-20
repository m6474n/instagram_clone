import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:instagram_clone/screens/login/login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index){
      return Column(children: [Container(height: 80,
        child: Row(children: [CircleAvatar(backgroundColor: Colors.white,radius: 32,),ListView.builder(itemBuilder: (context,index){
          return CircleAvatar(backgroundColor: Colors.white,radius: 32,);
        })],))],);
    }) ,);}}
