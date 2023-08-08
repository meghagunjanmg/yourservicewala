import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';
import 'package:yourservicewala/Screens/Packages.dart';

import 'HomeScreen.dart';

class SignupSuccess extends StatefulWidget {
  @override
  _SignupSuccessState createState() => _SignupSuccessState();
}

class _SignupSuccessState extends State<SignupSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          Image.asset("assets/BG02.jpg",fit: BoxFit.fill,height:MediaQuery.of(context).size.height , width: MediaQuery.of(context).size.width,),
          Center(
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(80.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),

                    SizedBox(height: 16.0),
                    Text(
                      'Signup Successful!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Your login and password have been saved.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      width: MediaQuery.of(context).size.width,

                      child: ElevatedButton(
                        onPressed: () {
                          // Add your navigation logic here to go back
                          Navigator.pop(context);
                        },
                        child: Text('Go Back'),
                      ),
                    ),

                Container(
                  width: MediaQuery.of(context).size.width,

                  child: ElevatedButton(
                    onPressed: () {
                      // Add your navigation logic here to go back
                Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => Packages(),
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
                    child: Text('Packages'),
                  ),
                ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}