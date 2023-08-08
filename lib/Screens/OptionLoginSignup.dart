import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourservicewala/Screens/LoginScreen.dart';
import 'package:yourservicewala/Screens/SignupScreen.dart';

class OptionLoginSignup extends StatefulWidget {
  @override
  _OptionLoginSignupState createState() => _OptionLoginSignupState();
}

class _OptionLoginSignupState extends State<OptionLoginSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Stack(
          children: [
            Image.asset("assets/BG01.jpg",fit: BoxFit.fill,height:MediaQuery.of(context).size.height , width: MediaQuery.of(context).size.width,),

            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace with your logo widget
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                SizedBox(height: 24,width: 40,),
                Text(
                  'Relax until your \n    car is done',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Welcome to our app!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(

                      onPressed: () {
                        // Add your login logic here
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = 0.0;
                                  var end = 1.0;
                                  var curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  return ScaleTransition(
                                    scale: animation.drive(tween),
                                    child: child,
                                  );}));
                      },
                      child: Text('Sign In'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.blue,
                          elevation: 0,
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.blue,
                          )),
                      onPressed: () {
                        // Add your signup logic here
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  var begin = 0.0;
                                  var end = 1.0;
                                  var curve = Curves.easeInOut;
                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  return ScaleTransition(
                                    scale: animation.drive(tween),
                                    child: child,
                                  );}));
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                Text(
                  'Agree with terms and conditions',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
       ] ),
    );
  }
}