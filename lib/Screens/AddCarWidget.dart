import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../constant/CustomWidget.dart';

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
  TextEditingController _carTypeController = TextEditingController();
  TextEditingController _registrationDateController = TextEditingController();
  TextEditingController _insuranceDateController = TextEditingController();
  File? _selectedImage;

  void _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedImage?.path ?? "");
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
            customWidget.buildTextField('Car Name', _carNameController, Icons.directions_car),
            customWidget.buildTextField('Car Model', _carModelController, Icons.car_repair),
            customWidget.buildTextField('Model Year', _modelYearController, Icons.calendar_today),
            customWidget.buildTextField('Car Number', _carNumberController, Icons.format_list_numbered),
            customWidget.buildTextField('Registration Number', _registrationNumberController, Icons.confirmation_number),
            customWidget.buildTextField('Car Type', _carTypeController, Icons.category),
            customWidget.buildTextField('Registration Date (DD/MM/YYYY)', _registrationDateController, Icons.date_range),
            customWidget.buildTextField('Insurance Date (DD/MM/YYYY)', _insuranceDateController, Icons.calendar_today),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Attach Car Photo (800X600)'),
                SizedBox(width: 8),
                ElevatedButton(
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
              onPressed: _onSave,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }


  void _onSave() {
    // Handle the form submission here
    // You can access the entered values using the controller variables.
    print('Car Name: ${_carNameController.text}');
    print('Car Model: ${_carModelController.text}');
    print('Model Year: ${_modelYearController.text}');
    print('Car Number: ${_carNumberController.text}');
    print('Registration Number: ${_registrationNumberController.text}');
    print('Car Type: ${_carTypeController.text}');
    print('Registration Date: ${_registrationDateController.text}');
    print('Insurance Date: ${_insuranceDateController.text}');
    print('Car Image: $_selectedImage');
  }
}
