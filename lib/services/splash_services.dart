import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobileScreenLayout.dart';
import 'package:instagram_clone/responsive/responsive.dart';
import 'package:instagram_clone/responsive/webScreenLayout.dart';
import 'package:instagram_clone/screens/tabs/home_screen.dart';
import 'package:instagram_clone/screens/login/login_screen.dart';

class SplashServices{

  void isLogin(BuildContext context
      ){
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 3),()=>
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResponsiveLayout(webScreenLayout: WebScreen(), mobileScreenLayout: MobileScreen())))
      );
    }else{
    Timer(Duration(seconds: 3), ()=>
      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()))

    );}
  }
}