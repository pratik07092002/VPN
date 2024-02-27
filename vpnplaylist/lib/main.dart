import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/screens/homescreen.dart';
late Size ScreenSize;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await AppPrefrences.initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {



  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Vpn App",
     theme: ThemeData(
      
      appBarTheme: AppBarTheme(elevation: 4, color: Colors.green,
       titleTextStyle: TextStyle(color: Colors.black,fontSize: 25),
      
      )
     ),
   themeMode: AppPrefrences.ismodedark ? ThemeMode.dark : ThemeMode.light,
     darkTheme: ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 25),
        color: Colors.green,
        elevation: 4
      ),
      
     ),
     debugShowCheckedModeBanner: false,
     home: HomeScreen(),





      
      
      

    );
  }
}



extension AppTheme on ThemeData
{
  Color get lightTextColor => AppPrefrences.ismodedark ? Colors.white : Colors.black;
  Color get BottomNavigationColor => AppPrefrences.ismodedark ? Colors.white : Colors.redAccent;
}