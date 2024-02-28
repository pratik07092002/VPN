import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/main.dart';
import 'package:vpnplaylist/widgets/Connectionbutton.dart';
import 'package:vpnplaylist/widgets/widgetsaroundconnect.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  BottomNavBar(context) {
    ScreenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Semantics(
      button: true,
      child: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.width * 0.05),
          height: 62,
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.flag_circle,
               
                size: 30,
              ),
              const SizedBox(
                width: 14,
              ),
              const Text(
                "Select Country",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.green.shade800,
                child: const Icon(
                  Icons.arrow_right,
                  size: 25,
                ),
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
        title: const Text("VPNAPP"),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.perm_device_info)),
        actions: [
          IconButton(
              onPressed: () {
                Get.changeThemeMode(AppPrefrences.ismodedark
                    ? ThemeMode.light
                    : ThemeMode.dark);

                AppPrefrences.ismodedark = !AppPrefrences.ismodedark;
              },
              icon: const Icon(Icons.mode_night_outlined))
        ],
      ),
      bottomNavigationBar: BottomNavBar(context),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 2 widgets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundWidget(
                  title: "Location",
                  subtitle: "Free",
                  IconFile: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.flag_circle),
                  )),
              RoundWidget(
                  title: "Speed",
                  subtitle: "Free",
                  IconFile: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.flag_circle),
                  ))
            ],
          ),

          // connection button
          ConnectionButton(),

          // 2 widgets

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundWidget(
                  title: "0 mbps",
                  subtitle: "Download",
                  IconFile: CircleAvatar(
                    child: Icon(Icons.flag_circle),
                    backgroundColor: Colors.green,
                  )),
              RoundWidget(
                  title: "0 mbps",
                  subtitle: "Upload",
                  IconFile: CircleAvatar(
                    child: Icon(Icons.flag_circle),
                    backgroundColor: Colors.green,
                  )) // connection button
            ],
          )
        ],
      ),
    );
  }
}
