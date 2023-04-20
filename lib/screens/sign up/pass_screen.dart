import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/blue_button.dart';
import 'package:instagram_clone/components/custom_button.dart';
import 'package:instagram_clone/components/inputField.dart';
import 'package:instagram_clone/screens/tabs/home_screen.dart';

class PasswordScreen extends StatefulWidget {
  final String email;
  const PasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
FirebaseAuth auth = FirebaseAuth.instance;
var confirmPass;
  bool loading = false;
  final passController = TextEditingController();
  final passNode = FocusNode();
  final passController1 = TextEditingController();
  final passNode1 = FocusNode();
  final _formKey = GlobalKey<FormState>();

void createAccount(){
setState(() {
  loading = true;

});
auth.createUserWithEmailAndPassword(email: widget.email.toString(), password: passController.text.toString()).then((value){

  setState(() {
    loading = false;
  });

  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
}).onError((error, stackTrace){
  setState(() {
    loading = false;
  });
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
});
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Text(
                "Create New Password",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 20,
              ),
       Form(
           key: _formKey,
           child: Column(children: [
         InputField(
           title: 'New Password',
           controller: passController,
           focusNode: passNode,
           validator: (value) {
             confirmPass = value;
             return value.isEmpty
                 ? "Enter Password"
                 : value.length < 6
                 ? "Password must be atleast 6 character"
                 : null;
           },
           keyboardType: TextInputType.visiblePassword,
         ),
         SizedBox(
           height: 20,
         ),
         InputField(
           title: 'Confirm Password',
           controller: passController1,
           focusNode: passNode1,
           validator: (value) {
             if(value.isEmpty){
               return 'Enter password';
             }
             if(value != confirmPass){
               return 'Password not matched';
             }
           },
           keyboardType: TextInputType.visiblePassword,
         ),
         SizedBox(
           height: 20,
         ),
         CustomButton(
             title: 'Create account',
             onPress: () {
              if(_formKey.currentState!.validate()){
               createAccount();
              }
             },
             loading: loading)
       ],)),
              Text(widget.email)
            ],
          ),
        ),
      ),
    );
  }
}
