import 'package:flutter/cupertino.dart';

class SignUpRequestModel {
  String? referalID;
  String? name;
  String? mobileNo;
  String? userPassword;
  String? emailID;
  String? userAddress;

  SignUpRequestModel(
      {required this.referalID,
        required this.name,
        required   this.mobileNo,
        required    this.userPassword,
        required  this.emailID,
        required  this.userAddress});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    referalID = json['referal_ID'];
    name = json['Name'];
    mobileNo = json['MobileNo'];
    userPassword = json['UserPassword'];
    emailID = json['EmailID'];
    userAddress = json['userAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['referal_ID'] = this.referalID;
    data['Name'] = this.name;
    data['MobileNo'] = this.mobileNo;
    data['UserPassword'] = this.userPassword;
    data['EmailID'] = this.emailID;
    data['userAddress'] = this.userAddress;
    return data;
  }
}
