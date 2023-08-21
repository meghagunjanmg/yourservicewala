import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourservicewala/models/ProfileResponse.dart';

import '../constant/APIs.dart';
import '../constant/ColorConstants.dart';
import '../constant/CustomWidget.dart';
import '../models/ProfileRequest.dart';


class EditProfileWidget extends StatefulWidget {
  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  CustomWidget customWidget = CustomWidget();
  ProfileResponse? response;


  TextEditingController _nameController = TextEditingController();
  TextEditingController _fatherHusbandController = TextEditingController();
  TextEditingController _address1Controller = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _packageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _alternateMobileController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();


  @override
  void initState() {
    super.initState();

      asyncMethod(); ///initiate your method here
  }

  Future<void> asyncMethod() async{

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final userMobileNo = prefs.getString('userMobileNo');
  final referal_ID = prefs.getString('referal_ID');
  final userName = prefs.getString('userName');
  final EmailID = prefs.getString('EmailID');
  final userAddress = prefs.getString('userAddress');

  _nameController.text = userName.toString();
  _address1Controller.text = userAddress.toString();
  _mobileController.text = userMobileNo.toString();
  _emailController.text = EmailID.toString();

  }

  @override
  Widget build(BuildContext context) {
   /// asyncMethod();

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child:
                Container(
                    height: 100,
                    width: 100,
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

            customWidget.buildTextField(context,'Your Name', _nameController, Icons.person),
            customWidget.buildTextField(context,'Father/Husband', _fatherHusbandController, Icons.person_outline),
            customWidget.buildTextField(context,'Address_1', _address1Controller, Icons.home),
            customWidget.buildTextField(context,'State', _stateController, Icons.location_on),
            customWidget.buildTextField(context,'Pincode', _pincodeController, Icons.pin_drop),
            customWidget.buildTextField(context,'Email ID', _emailController, Icons.email),
            customWidget.buildTextField(context,'Your Package', _packageController, Icons.card_membership),
            customWidget.buildTextField(context,'Gender', _genderController, Icons.people),
            customWidget.buildTextField(context,'City', _cityController, Icons.location_city),
            customWidget.buildTextField(context,'Mobile', _mobileController, Icons.phone, isRequired: true),
            customWidget.buildTextField(context,'Alternate Mobile', _alternateMobileController, Icons.phone_android),
            customWidget.buildTextField(context,'Birth Date (Real)', _birthDateController, Icons.cake),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.darkBlueTheme, // Change the background color here
              ),
              onPressed: _onSubmit,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }



  void _onSubmit() {
    // Handle the form submission here
    // You can access the entered values using the controller variables.
    print('Your Name: ${_nameController.text}');
    print('Father/Husband: ${_fatherHusbandController.text}');
    print('Address_1: ${_address1Controller.text}');
    print('State: ${_stateController.text}');
    print('Pincode: ${_pincodeController.text}');
    print('Email ID: ${_emailController.text}');
    print('Your Package: ${_packageController.text}');
    print('Gender: ${_genderController.text}');
    print('City: ${_cityController.text}');
    print('Mobile: ${_mobileController.text}');
    print('Alternate Mobile: ${_alternateMobileController.text}');
    print('Birth Date (Real): ${_birthDateController.text}');


    ProfileRequest request =  ProfileRequest(Name: _nameController.text.toString(),
        MobileNo: _mobileController.text.toString(),EmailID: _emailController.text.toString(), userAddress: _address1Controller.text.toString());

    API.EditProfileAPI(context, request);

  }
}
