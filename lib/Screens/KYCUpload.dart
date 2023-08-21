import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../constant/ColorConstants.dart';

class KYCUpload extends StatefulWidget {
  @override
  _KYCUploadState createState() => _KYCUploadState();
}

class _KYCUploadState extends State<KYCUpload> {
  File? _aadhaarFront;
  File? _aadhaarBack;
  File? _panCard;
  File? _profilePic;

  void _pickImage(ImageType type) async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    setState(() {
      switch (type) {
        case ImageType.aadhaarFront:
          _aadhaarFront = File(pickedImage.path);
          break;
        case ImageType.aadhaarBack:
          _aadhaarBack = File(pickedImage.path);
          break;
        case ImageType.panCard:
          _panCard = File(pickedImage.path);
          break;
        case ImageType.profilePic:
          _profilePic = File(pickedImage.path);
          break;
      }
    });
  }

  Widget _buildImageSection(String title, File? imageFile, ImageType type) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickImage(type),
          child: Container(
            width: 300,
            height: 200,
            color: Colors.grey[300],
            child: imageFile == null
                ? Icon(Icons.add_a_photo, size: 60, color: Colors.grey)
                : Image.file(imageFile, fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
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
          "KYC Upload",
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
            _buildImageSection('Aadhaar Front', _aadhaarFront, ImageType.aadhaarFront),
            _buildImageSection('Aadhaar Back', _aadhaarBack, ImageType.aadhaarBack),
            _buildImageSection('PAN Card', _panCard, ImageType.panCard),
            _buildImageSection('Profile Picture', _profilePic, ImageType.profilePic),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.darkBlueTheme, // Change the background color here
              ),
              onPressed: _onSubmit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    // Handle the form submission here
    // You can access the image files using the file variables (_aadhaarFront, _aadhaarBack, etc.).
    // You can upload the images to a server or perform any other processing.
    print('Aadhaar Front: $_aadhaarFront');
    print('Aadhaar Back: $_aadhaarBack');
    print('PAN Card: $_panCard');
    print('Profile Picture: $_profilePic');
  }
}

enum ImageType {
  aadhaarFront,
  aadhaarBack,
  panCard,
  profilePic,
}
