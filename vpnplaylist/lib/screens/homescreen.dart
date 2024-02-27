import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavBar(context){
    ScreenSize = MediaQuery.of(context).size;
    return SafeArea(child: Semantics(
      button: true,
      child: InkWell(
        onTap: (){},
        child: Container(
          color: Colors.green
          ,padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05 ),
        height: 62,
        child: Row(
          children: [
            Icon(
              CupertinoIcons.flag_circle,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 14,
            ),
            Text("select Country",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_right,
              
              color: AppPrefrences.ismodedark ? Colors.green : Colors.redAccent,size: 25,),
              
            )

          ],
        ),
        ),
      ),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VPNAPP"),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.perm_device_info)),
        actions: [
          IconButton(onPressed: (){

            Get.changeThemeMode(
              AppPrefrences.ismodedark ? ThemeMode.light : ThemeMode.dark
            );

            AppPrefrences.ismodedark = ! AppPrefrences.ismodedark;
          }, icon: Icon(Icons.mode_night_outlined))
        ],
      ),
    bottomNavigationBar: BottomNavBar(context),
    );
  }
}