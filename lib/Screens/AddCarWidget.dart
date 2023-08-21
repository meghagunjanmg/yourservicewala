import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourservicewala/models/CarRequest.dart';
import 'dart:io';

import '../constant/APIs.dart';
import '../constant/ColorConstants.dart';
import '../constant/CustomDialog.dart';
import '../constant/CustomWidget.dart';
import '../models/CartypeResponse.dart';

class AddCarWidget extends StatefulWidget {
  @override
  _AddCarWidgetState createState() => _AddCarWidgetState();
}

class _AddCarWidgetState extends State<AddCarWidget> {
  CustomWidget customWidget = CustomWidget();

  TextEditingController _carNameController = TextEditingController();
  TextEditingController _carModelController = TextEditingController();
  TextEditingController _modelYearController = TextEditingController();
  TextEditingController _carNumberController = TextEditingController();
  TextEditingController _registrationNumberController = TextEditingController();
  TextEditingController _registrationDateController = TextEditingController();
  TextEditingController _insuranceDateController = TextEditingController();
  File? _selectedImage;

  void _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedImage?.path ?? "");
    });
  }
  List<Cartype> models = [];
  Cartype? selectedModel;
  String selectedValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPiData();
  }

  getAPiData() async {
    var response = await API.GetCarType(context);
    setState(() {
        models  = response.Cartypes;
    });
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
          "Add Car",
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
            customWidget.buildTextField(context,'Car Name', _carNameController, Icons.directions_car),
            customWidget.buildTextField(context,'Car Model', _carModelController, Icons.car_repair),
            customWidget.buildTextField(context,'Model Year', _modelYearController, Icons.calendar_today),
            customWidget.buildTextField(context,'Car Number', _carNumberController, Icons.format_list_numbered),

            customWidget.buildTextField(context,'Registration Number', _registrationNumberController, Icons.confirmation_number),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child:DropdownButtonFormField<Cartype>(
          value: selectedModel,
          onChanged: (newValue) {
            setState(() {
              selectedModel = newValue!;
            });
          },
          decoration: InputDecoration(
            labelText: 'Select an Car Type',
            filled: true,
            fillColor: Color(0xFFE4E6F1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
          ),
          items:models
              .map<DropdownMenuItem<Cartype>>((Cartype value) {
            return DropdownMenuItem<Cartype>(
              value: value,
              child: Text(value.CarName),
            );
          }).toList(),
        )
      ),
              ],
            ),

              customWidget.buildTextField(context,'Registration Date (DD/MM/YYYY)', _registrationDateController, Icons.date_range),
              customWidget.buildTextField(context,'Insurance Date (DD/MM/YYYY)', _insuranceDateController, Icons.date_range),

            SizedBox(height: 16),
            Row(
              children: [
                Text('Attach Car Photo (800X600)'),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorConstants.darkBlueTheme, // Change the background color here
                  ),
                  onPressed: _pickImage,
                  child: Text('Choose Photo'),
                ),
              ],
            ),

            _selectedImage != null
                ? Image.file(_selectedImage!, width: 80, height: 60, fit: BoxFit.fitHeight)
                : Container(),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.darkBlueTheme, // Change the background color here
              ),
              onPressed: _onSave,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _onSave() async {
    // Handle the form submission here
    // You can access the entered values using the controller variables.
    print('Car Name: ${_carNameController.text}');
    print('Car Model: ${_carModelController.text}');
    print('Model Year: ${_modelYearController.text}');
    print('Car Number: ${_carNumberController.text}');
    print('Registration Number: ${_registrationNumberController.text}');
    print('Car Type: ${selectedModel!.Sno}');
    print('Registration Date: ${_registrationDateController.text}');
    print('Insurance Date: ${_insuranceDateController.text}');
    print('Car Image: $_selectedImage');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phoneNumber = await prefs.getString("userMobileNo");


    CarRequest request =  CarRequest(MobileNo: phoneNumber!,
        Carname: _carNameController.text.toString(),
        Modelno: _carModelController.text.toString(),
        modelyear: _modelYearController.text.toString(),
        CarNumber: _carNumberController.text.toString(),
        Registrationno: _registrationNumberController.text.toString(),
        InsuranceDate: _insuranceDateController.text.toString(),
        ragistrationDate: _registrationDateController.text.toString(),
        CarType: selectedModel!.Sno.toString());


    API.AddCar(context, request);


  }



}
