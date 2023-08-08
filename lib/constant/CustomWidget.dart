import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorConstants.dart';

class CustomWidget{
   Widget buildTextField(String label, TextEditingController controller, IconData icon, {bool isRequired = false}) {
    return

      Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          hintText: isRequired ? '*Required' : '',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Colors.blue),
          ),
          hintStyle: TextStyle(color: Colors.blue),
          filled: true,
          fillColor: ColorConstants.textFieldBgTheme,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}