import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourservicewala/Screens/AddCarWidget.dart';
import 'package:yourservicewala/Screens/SplashScreen.dart';
import 'package:yourservicewala/main.dart';

import '../constant/ColorConstants.dart';
import 'CarReservationWidget.dart';
import 'ChangePasswordWidget.dart';
import 'CreateTicketWidget.dart';
import 'Dashboard.dart';
import 'EditProfileWidget.dart';
import 'KYCUpload.dart';
import 'Packages.dart';
import 'RewardScreen.dart';
import 'ViewTicketWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  String? name;
  String? phone;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();

   // asyncMethod(); ///initiate your method here
  }

  Future<void> asyncMethod() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final userMobileNo = prefs.getString('userMobileNo');
    final referal_ID = prefs.getString('referal_ID');
    final userName = prefs.getString('userName');
    final EmailID = prefs.getString('EmailID');
    final userAddress = prefs.getString('userAddress');

    setState(() {
      name = userName;
      phone = userMobileNo;
    });

  }

  @override
  Widget build(BuildContext context) {
    asyncMethod(); ///initiate your method here

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.darkBlueTheme,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (name != null)?
            Text('Welcome\n$name',style: TextStyle(fontSize: 16),)
            :
                Text(""),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (name != null)?
                Text('$name',style: TextStyle(fontSize: 16),):Text(""),
                (phone != null)?
                Text('$phone',style: TextStyle(fontSize: 14),):Text("")
              ],
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
          ],
        )
            ]
        ),
      ),
      drawer: Theme(
    data: Theme.of(context).copyWith(
    canvasColor: ColorConstants.lightBlueTheme, //desired color
    ),
    child:  Container(
      margin: EdgeInsets.symmetric(vertical: 18),
      child: Drawer(
        elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                child:
               Container(
                 color: ColorConstants.darkBlueTheme,
                 child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 80,
                        child: Image.asset('assets/logo.png'),
                      ),
                  ),
               ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Dashboard',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap
                      setState(() {
                        _currentIndex=0;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Profile',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.contact_page,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap

                      Navigator.pop(context);

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => EditProfileWidget(),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('KYC Upload',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.credit_card,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap

                      Navigator.pop(context);

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => KYCUpload(),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),

              Column(
                children: [
                  ListTile(
                    title: Text('Add Car',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.car_crash,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap

                      Navigator.pop(context);

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => AddCarWidget(),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),

              Column(
                children: [
                  ListTile(
                    title: Text('Calender',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap

                      Navigator.pop(context);

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => CarReservationWidget(),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Rewards and referals',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.diamond,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap

                      setState(() {
                        _currentIndex=2;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Add Ticket',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.support_agent,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      Navigator.pop(context);

                      // Handle drawer item 1 tap
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => CreateTicketWidget(),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('View Ticket',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.support_agent,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      Navigator.pop(context);

                      // Handle drawer item 1 tap
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => ViewTicketWidget(),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),

              Column(
                children: [
                  ListTile(
                    title: Text('Settings',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () {
                      // Handle drawer item 1 tap
                      Navigator.pop(context);

                      setState(() {
                        _currentIndex=3;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  ListTile(
                    title: Text('Logout',style: TextStyle(color: Colors.white,fontSize:18),),
                    leading:
                    CircleAvatar(
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      backgroundColor: ColorConstants.darkBlueTheme,
                    ),
                    onTap: () async {
                      // Handle drawer item 1 tap
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('is_login', false);

                      await prefs.clear();
                      Navigator.pop(context);

                      Restart.restartApp();


                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: ColorConstants.darkBlueTheme),
                      onPressed: (){
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => Packages(),
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
                      child: Text("Subscribe Now"),
                    )
                  ),
                ],
              ),

            ],
          ),
        ),
    ),
      ),
      body: Container(
        child:
        (_currentIndex == 3)?ChangePasswordWidget():
        (_currentIndex == 2)?RewardScreen():
        (_currentIndex == 0)?Dashboard(): Text('Content for Bottom Navigation Item $_currentIndex'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.blue,),
            label:"Setting",
          ),
        ],
      ),
    );
  }
}