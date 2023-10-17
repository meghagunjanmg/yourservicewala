import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:yourservicewala/Screens/AddCarWidget.dart';
import 'package:yourservicewala/constant/CarsDetailsWidget.dart';
import 'package:yourservicewala/constant/ColorConstants.dart';
import 'package:yourservicewala/models/CarsDetail.dart';

import '../constant/APIs.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> carImages = [
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
  ];
  bool isloading = true;

  List<CarsDetail> carDetails = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    APICall();
  }

  Future<void> APICall() async {
    var response = await API.GetCarlist(context);
    setState(() {
      carDetails  = response.CarsDetails;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Cars',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            // Carousel Banner
            Container(
              height: 200,
              child: Swiper(
                itemCount: carImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    carImages[index],
                    fit: BoxFit.cover,
                  );
                },
                pagination: SwiperPagination(),
                autoplay: true,
              ),
            ),


            (isloading==true)?
            Center(
              child: LoadingAnimationWidget.inkDrop(
                color: ColorConstants.lightBlueTheme,
                size: 100,
              ),
            )
                :

            (carDetails.length>0)?
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(4),
              color: ColorConstants.textFieldBgTheme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("My Cars" , style: TextStyle(color:ColorConstants.darkBlueTheme ,fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                Divider(
                  color: ColorConstants.darkBlueTheme,
                  thickness: 1.5,
                ),
        CarsDetailWidget(carDetails),


    ]),
            )
              :
                Container(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddCarWidget()));
                  },child: Text("Add Car"),),
                )

          ],
        ),
      ),
    );
  }

}

