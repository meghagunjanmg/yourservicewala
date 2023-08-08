import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:yourservicewala/constant/ColorConstants.dart';

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

  List<Map<String, String>> carDetails = [
    {
      'model': 'Audi A4',
      'year': '2022',
      'type': 'Sedan',
      'color': 'White',
    },
    {
      'model': 'BMW X5',
      'year': '2021',
      'type': 'SUV',
      'color': 'Black',
    },
    {
      'model': 'Mercedes-Benz C-Class',
      'year': '2023',
      'type': 'Coupe',
      'color': 'Red',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
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
                // List of Car Details Cards
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemCount: carDetails.length,
                //   itemBuilder: (context, index) {
                //     return CarCard(
                //       model: carDetails[index]['model']!,
                //       year: carDetails[index]['year']!,
                //       type: carDetails[index]['type']!,
                //       color: carDetails[index]['color']!,
                //     );
                //   },
                // ),
                Divider(
                  color: ColorConstants.darkBlueTheme,
                  thickness: 1.5,
                ),
      Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(4),
               child:
               Image.network(
                 "https://rukminim1.flixcart.com/image/850/1000/car/j/x/b/maruti-suzuki-manual-ldi-swift-dzire-original-imaect749hazztka.jpeg?q=90",),
      ),
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(4),
                  color: ColorConstants.lightBlueTheme,
                  child: Text("Car Name",style: TextStyle(fontSize: 14,color: Colors.white),),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Text("Model No",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                ),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    color: ColorConstants.lightBlueTheme,
                    child: Text("Model Year",style: TextStyle(fontSize: 14,color: Colors.white),),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    color: Colors.white,
                    child: Text("Car Type",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    color: ColorConstants.lightBlueTheme,
                    child: Text("Car Number",style: TextStyle(fontSize: 14,color: Colors.white),),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    color: Colors.white,
                    child: Text("Registration No",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    color: ColorConstants.lightBlueTheme,
                    child: Text("Insurance Date",style: TextStyle(fontSize: 14,color: Colors.white),),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.all(4),
                    color: Colors.white,
                    child: Text("Insurance Number",style: TextStyle(fontSize: 14,color: ColorConstants.darkBlueTheme),),
                  ),

                ],),
            )


          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String model;
  final String year;
  final String type;
  final String color;

  CarCard({required this.model, required this.year, required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Year: $year'),
            Text('Type: $type'),
            Text('Color: $color'),
          ],
        ),
      ),
    );
  }
}
