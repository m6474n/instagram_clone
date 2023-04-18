import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return WillPopScope(onWillPop: () async{
      SystemNavigator.pop();
      return true;
    },
    child: Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home '),),
    floatingActionButton: FloatingActionButton(onPressed: () {  
      auth.signOut().then((value){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Log out!')));
Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
      }).onError((error, stackTrace){
        
      });
    },child: Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      gradient: LinearGradient(colors: [
        Colors.orange, Colors.pink,Colors.purple,

      ],begin: Alignment.bottomLeft,end: Alignment.topRight)
    ),child: Center(child: Icon(Icons.logout_rounded, color: Colors.white,)),),),
    ));

  }
}
