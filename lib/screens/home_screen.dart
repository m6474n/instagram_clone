import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async{
      SystemNavigator.pop();
      return true;
    },
    child: Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home '),),));
  }
}
