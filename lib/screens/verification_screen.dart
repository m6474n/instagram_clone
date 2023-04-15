import 'package:flutter/material.dart';
import 'package:instagram_clone/components/blue_button.dart';
import 'package:instagram_clone/components/inputField.dart';
import 'package:instagram_clone/components/transparent_button.dart';

class VerificationScreen extends StatefulWidget {
   var num ;
   VerificationScreen({Key? key, this.num = "+92340000000"}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreen();
}

class _VerificationScreen extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child:  Column(
              children: [
                Text(
                  "Enter the confirmation code",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 30),
                  child: Text(
                    'To confirm your account, enter the 6-digit code we sent to $num',
                    style: TextStyle(color: Colors.grey.shade100, fontSize: 17),
                  ),
                ),
                InputField(title: 'Confirmation code'),

                SizedBox(height: 20,),
                BlueButton(title: 'Next', onPress: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationScreen()))
                },),
                SizedBox(height: 20,),
                TransparentButton(title: "I didn't get the code", onPress: () {  },)
              ],
            ),

        ),
      ),
    );
  }
}
