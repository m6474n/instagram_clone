import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobileScreenLayout.dart';
import 'package:instagram_clone/responsive/responsive.dart';
import 'package:instagram_clone/responsive/webScreenLayout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/splash_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDz7Gw6NQtkdqSk4_PsSWRwD95hJMLYJnY",
            appId: "1:284857883843:web:58c6d9cc821ec586c25676",
            messagingSenderId: "284857883843",
            projectId: "instagram-clone-22d0f",storageBucket: "instagram-clone-22d0f.appspot.com"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: ResponsiveLayout(
      //   webScreenLayout: WebScreen(),
      //   mobileScreenLayout: MobileScreen(),)
      home: SplashScreen(),
    );
  }
}
