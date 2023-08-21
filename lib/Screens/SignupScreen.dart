import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourservicewala/constant/APIs.dart';
import 'package:yourservicewala/models/SignUpRequestModel.dart';

import '../constant/ColorConstants.dart';
import 'LoginScreen.dart';
import 'VerifyOtpScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool agreeToTerms = false;
  bool Sponsered = false;


  TextEditingController referalNumberController = new TextEditingController();
  TextEditingController sponsorNameController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController userAddressController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child:
                Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.25), // border color
                    shape: BoxShape.circle,
                  ),
                  child:
                  new GestureDetector(
                    onTap: (){

                    },
                   child: Container( //
                      // or ClipRRect if you need to clip the content
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green, // inner circle color
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ), // inner content
                    ),
                  )

                ),
              ),
              SizedBox(height: 16),
              Text(
                'First Time? Fill your Details',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Sign up to join',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: Sponsered,
                    onChanged: (value) {
                      setState(() {
                        Sponsered = value!;
                      });
                    },
                  ),
                  Text('Do Not Have Sponsor Mobile?'),
                ],
              ),
              (Sponsered==false)?
              Column(
                children: [
                  SizedBox(height: 12),
                  Container(
                    child: TextField(
                      controller: referalNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      onChanged: (String text) async {
                        if(text.length==10){
                          String SponserName = await API.ReferalId(context, text);
                              sponsorNameController.text=SponserName;
                        }
                      },
                      decoration: InputDecoration(
                        counterText: "",

                        labelText: 'Referral Mobile Number',
                        prefixIcon:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/phone.svg',
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        filled: true,
                        fillColor: ColorConstants.textFieldBgTheme,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),),
                  ),
                  SizedBox(height: 12),
                  Container(
                     
                    child: TextField(
                      controller: sponsorNameController,

                      decoration: InputDecoration(
                        labelText: 'Sponsor Name',
                        prefixIcon:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/contact_person.svg',
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.blue),
                        filled: true,
                        fillColor: ColorConstants.textFieldBgTheme,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                      ),),
                  ),
                ],
              ):Container(),

              SizedBox(height: 12),
              Container(
                child: TextField(
                  controller: userNameController,

                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/contact_person.svg',
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: ColorConstants.textFieldBgTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),),
              ),
              SizedBox(height: 12),
              Container(
                child: TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    counterText: "",

                    labelText: 'Mobile Number',
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/phone.svg',
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: ColorConstants.textFieldBgTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),),
              ),
              SizedBox(height: 12),
              Container(
                child: TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: 'Email Id',
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/messesge.svg',
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: ColorConstants.textFieldBgTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),),
              ),
              SizedBox(height: 12),
              Container(
                child: TextField(
                  controller: userAddressController,

                  decoration: InputDecoration(
                    labelText: 'Full Address',
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/location.svg',
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: ColorConstants.textFieldBgTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),),
              ),
              SizedBox(height: 12),
              Container(
                 child: TextField(
                  controller: passwordController,

                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/password.svg',
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: ColorConstants.textFieldBgTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),),
              ),
              SizedBox(height: 12),
              Container(
                child: TextField(
                  controller: confirmController,

                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/password.svg',
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.blue),
                    filled: true,
                    fillColor: ColorConstants.textFieldBgTheme,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),),
              ),

              SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value!;
                      });
                    },
                  ),
                  Text('I agree with the terms and conditions'),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: MediaQuery.of(context).size.width,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.darkBlueTheme, // Change the background color here
                  ),
                  onPressed: () {
                    // Add your signup logic here
                      if(agreeToTerms==true){
                        if(passwordController.text.toString() == confirmController.text.toString()) {
                          if (passwordController.text.isNotEmpty &&
                          phoneNumberController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                            SignUpRequestModel model = SignUpRequestModel(
                              referalID: referalNumberController.text
                                  .toString(),
                              name: userNameController.text.toString(),
                              mobileNo: phoneNumberController.text.toString(),
                              emailID: emailController.text.toString(),
                              userAddress: userAddressController.text
                                  .toString(),
                              userPassword: passwordController.text.toString(),
                            );

                            API.SignUpAPI(context, model);

                          }
                          else{
                            Fluttertoast.showToast(
                                msg: "Please enter all the fields",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Confirm password should be same as password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Please Agree to the Terms and Condition",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                  },
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Add your navigation logic here
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
                child: Text(
                  'Already have an account? Sign in now',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
