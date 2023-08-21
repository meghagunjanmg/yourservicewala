import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourservicewala/Screens/SignupScreen.dart';
import 'package:yourservicewala/Screens/SignupSuccess.dart';

import '../constant/ColorConstants.dart';

class VerifyOtpScreen extends StatefulWidget {
  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController _otpController = TextEditingController();
  int _remainingTime = 60;
  Timer? _timer;

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_remainingTime < 1) {
          timer.cancel();
        } else {
          _remainingTime -= 1;
        }
      });
    });
  }

  void _resendOtp() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _remainingTime = 60;
    _startTimer();
  }

  void _verifyOtp() {
    // Add your OTP verification logic here
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => SignupSuccess(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = 0.0;
              var end = 1.0;
              var curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return ScaleTransition(
                scale: animation.drive(tween),
                child: child,
              );}));
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Text(
          "Verifying Number",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the 6-digit OTP code sent to your phone number:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                for (int i = 0; i < 6; i++)
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: TextField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: '-',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.darkBlueTheme, // Change the background color here
              ),
              onPressed: _verifyOtp,
              child: Text('Verify'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _resendOtp,
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Text(
                  '$_remainingTime s',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}