import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/CarsDetail.dart';
import 'ColorConstants.dart';

class CarsDetailWidget extends StatelessWidget{
  List<CarsDetail> detailWidget;


  CarsDetailWidget(this.detailWidget);

  @override
  Widget build(BuildContext context) {
   return
     ListView.builder(
         scrollDirection: Axis.vertical,
         physics: NeverScrollableScrollPhysics(),
         shrinkWrap: true,
         itemCount: detailWidget.length,
         itemBuilder: (context,index){
           return  Card(
             child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Image.network(
                   "https://rukminim1.flixcart.com/image/850/1000/car/j/x/b/maruti-suzuki-manual-ldi-swift-dzire-original-imaect749hazztka.jpeg?q=90",
                   height: 100,
                 ),
                 Container(
                   padding: EdgeInsets.all(4),
                   margin: EdgeInsets.all(4),
                   color: ColorConstants.lightBlueTheme,
                   child: Text("Manufacture Name: ${detailWidget[index].Manufacturer}",style: TextStyle(fontSize: 14,color: Colors.white),),
                 ),
                 Container(
                   padding: EdgeInsets.all(4),
                   margin: EdgeInsets.all(4),
                   color: Colors.white,
                   child: Text("Model Number: ${detailWidget[index].modelno}",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                 ),
                 Container(
                   padding: EdgeInsets.all(4),
                   margin: EdgeInsets.all(4),
                   color: ColorConstants.lightBlueTheme,
                   child: Text("Car Number: ${detailWidget[index].Carno}",style: TextStyle(fontSize: 14,color: Colors.white),),
                 ),
                 Container(
                   padding: EdgeInsets.all(4),
                   margin: EdgeInsets.all(4),
                   color: Colors.white,
                   child: Text("Car Type: ${detailWidget[index].carType}",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                 ),
                 Container(
                   padding: EdgeInsets.all(4),
                   margin: EdgeInsets.all(4),
                   color: ColorConstants.lightBlueTheme,
                   child: Text("Insurance Date: ${detailWidget[index].InsuranceDate}",style: TextStyle(fontSize: 14,color: Colors.white),),
                 ),
                 Container(
                   padding: EdgeInsets.all(4),
                   margin: EdgeInsets.all(4),
                   color: Colors.white,
                   child: Text("Registration Date: ${detailWidget[index].ragistrationDate}",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                 ),
               ],
             ),
           );
         }
     );



  }

}