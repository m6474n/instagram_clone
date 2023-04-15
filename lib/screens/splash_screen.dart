import 'package:flutter/material.dart';
import 'package:instagram_clone/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    SplashServices().isLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(body: Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                height: 30,
              ) , Container(
                child: Column(children: [Text('from',style: TextStyle(color: Colors.white,fontSize: 18),),Image(image: AssetImage('assets/meta-logo.png'),height: 45,)],),


              )
            ],
          ),
        ),
        Center(child: Image(image: AssetImage('assets/logo.png'),height: 80,))
      ],
    ));
  }
}
