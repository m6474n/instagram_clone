import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login/login_screen.dart';

class SplashServices{
  FirebaseAuth auth = FirebaseAuth.instance;
  void isLogin(BuildContext context
      ){
    final user = auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 3),()=>
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()))
      );
    }
    Timer(Duration(seconds: 3), ()=>
      Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()))
      
    );
  }
}