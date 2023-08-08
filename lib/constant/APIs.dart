import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourservicewala/Screens/VerifyOtpScreen.dart';
import 'package:yourservicewala/models/ResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:yourservicewala/models/SignUpRequestModel.dart';

import '../Screens/HomeScreen.dart';
import '../models/ProfileRequest.dart';
import '../models/ProfileResponse.dart';

class API {
     static String HeaderUserId = "11";
     static String HeaderPassword = "21";



    static void LoginAPI(BuildContext context,String PhoneNumber,String Password)  async {

    var bod = jsonEncode({
      "USER_ID":PhoneNumber,
      "Passwd":Password
    });

    Map<String,String> hed = new Map();
    hed.putIfAbsent("UserId", () => HeaderUserId);
    hed.putIfAbsent("Passw", () => HeaderPassword);
    hed.putIfAbsent("Content-Type", () => "application/json");


    var url = Uri.https("yourservicewala.in", "/testingapi/Logins");
    var response = await http.post( url, body: bod, headers: hed );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    String jsonObjectStr = response.body.toString();

    Map<String, dynamic> jsonObject = json.decode(jsonObjectStr);
    ResponseModel responseModel = ResponseModel.fromJson(jsonObject);
    print('Response title: '+responseModel.status.toString());
    print('Response title: '+responseModel.description.toString());

    if(responseModel.status==1){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_login', true);
      await prefs.setString('userMobileNo', PhoneNumber);
      API.GetProfileAPI(context, PhoneNumber.toString());

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = 0.0;
                var end = 1.0;
                var curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return ScaleTransition(
                  scale: animation.drive(tween),
                  child: child,
                );
              }));
    }
    else{
      Fluttertoast.showToast(
          msg: responseModel.description.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

    static void SignUpAPI(BuildContext context,SignUpRequestModel signUpModel)  async {

     var bod = jsonEncode({
       "referal_ID":signUpModel.referalID.toString(),
       "Name":signUpModel.name.toString(),
       "MobileNo":signUpModel.mobileNo.toString(),
       "UserPassword":signUpModel.userPassword.toString(),
       "EmailID":signUpModel.emailID.toString(),
       "userAddress":signUpModel.userAddress.toString()
     });

     Map<String,String> hed = new Map();
     hed.putIfAbsent("UserId", () => HeaderUserId);
     hed.putIfAbsent("Passw", () => HeaderPassword);

     hed.putIfAbsent("Content-Type", () => "application/json");


     var url = Uri.https("yourservicewala.in", "/testingapi/userRegistration");
     var response = await http.post( url, body: bod, headers: hed );

     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');


     String jsonObjectStr = response.body.toString();

     Map<String, dynamic> jsonObject = json.decode(jsonObjectStr);
     ResponseModel responseModel = ResponseModel.fromJson(jsonObject);
     print('Response title: '+responseModel.status.toString());
     print('Response title: '+responseModel.description.toString());

     if(responseModel.status==1){
       Navigator.pushReplacement(
           context,
           PageRouteBuilder(
               pageBuilder: (context, animation, secondaryAnimation) => VerifyOtpScreen(),
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
     else{
       Fluttertoast.showToast(
           msg: responseModel.description.toString(),
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.blue,
           textColor: Colors.white,
           fontSize: 16.0
       );
     }
   }

     static void GetProfileAPI(BuildContext context,String PhoneNumber)  async {

       var bod = jsonEncode({
         "MobileNo":PhoneNumber
       });

       Map<String,String> hed = new Map();
       hed.putIfAbsent("UserId", () => HeaderUserId);
       hed.putIfAbsent("Passw", () => HeaderPassword);
       hed.putIfAbsent("Content-Type", () => "application/json");


       var url = Uri.https("yourservicewala.in", "/testingapi/GetUserDetails");
       var response = await http.post( url, body: bod, headers: hed );

       print('Response status: ${response.statusCode}');
       print('Response body: ${response.body}');


       String jsonObjectStr = response.body.toString();

       Map<String, dynamic> jsonObject = json.decode(jsonObjectStr);
       ProfileResponse responseModel = ProfileResponse.fromJson(jsonObject);

       if(responseModel.Name.length>1){
         final SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setString('userName', responseModel.Name.toString());
         await prefs.setString('referal_ID', responseModel.referalID.toString());
         await prefs.setString('userMobileNo', responseModel.MobileNo.toString());
         await prefs.setString('EmailID', responseModel.EmailID.toString());
         await prefs.setString('userAddress', responseModel.userAddress.toString());
         await prefs.setString('userMobileNo', responseModel.MobileNo.toString());

       }
       else{
         Fluttertoast.showToast(
             msg: "NO DATA FOUND",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.blue,
             textColor: Colors.white,
             fontSize: 16.0
         );
       }
     }

     static void EditProfileAPI(BuildContext context,ProfileRequest request)  async {


       var bod = jsonEncode({
         "Name":request.Name,
         "MobileNo":request.MobileNo,
         "EmailID":request.EmailID,
         "userAddress":request.userAddress
       });

       Map<String,String> hed = new Map();
       hed.putIfAbsent("UserId", () => HeaderUserId);
       hed.putIfAbsent("Passw", () => HeaderPassword);
       hed.putIfAbsent("Content-Type", () => "application/json");


       var url = Uri.https("yourservicewala.in", "/testingapi/EditUser");
       var response = await http.post( url, body: bod, headers: hed );

       print('Response status: ${response.statusCode}');
       print('Response body: ${response.body}');


       String jsonObjectStr = response.body.toString();

       Map<String, dynamic> jsonObject = json.decode(jsonObjectStr);

       ResponseModel responseModel = ResponseModel.fromJson(jsonObject);
       print('Response title: '+responseModel.status.toString());
       print('Response title: '+responseModel.description.toString());

       if(responseModel.status==1){
         final SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setString('userName', request.Name.toString());
         await prefs.setString('userMobileNo', request.MobileNo.toString());
         await prefs.setString('EmailID', request.EmailID.toString());
         await prefs.setString('userAddress', request.userAddress.toString());

         Fluttertoast.showToast(
             msg: responseModel.description.toString(),
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.blue,
             textColor: Colors.white,
             fontSize: 16.0
         );
       }
       else{
         Fluttertoast.showToast(
             msg: responseModel.description.toString(),
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.blue,
             textColor: Colors.white,
             fontSize: 16.0
         );
       }

     }

     static Future<String> ReferalId(BuildContext context,String PhoneNumber)  async {

       var bod = jsonEncode({
         "MobileNo":PhoneNumber
       });

       Map<String,String> hed = new Map();
       hed.putIfAbsent("UserId", () => HeaderUserId);
       hed.putIfAbsent("Passw", () => HeaderPassword);
       hed.putIfAbsent("Content-Type", () => "application/json");


       var url = Uri.https("yourservicewala.in", "/testingapi/checkreferal");
       var response = await http.post( url, body: bod, headers: hed );

       print('Response status: ${response.statusCode}');
       print('Response body: ${response.body}');


       String jsonObjectStr = response.body.toString();

       Map<String, dynamic> jsonObject = json.decode(jsonObjectStr);
       ResponseModel responseModel = ResponseModel.fromJson(jsonObject);
       print('Response title: '+responseModel.status.toString());
       print('Response title: '+responseModel.description.toString());

       return responseModel.description.toString();
     }

}