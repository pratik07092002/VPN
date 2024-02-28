import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/appengine/vpnengine.dart';
import 'package:vpnplaylist/controllers/homecontroller.dart';
import 'package:vpnplaylist/main.dart';
import 'package:vpnplaylist/models/vpnservermodel.dart';
import 'package:vpnplaylist/models/vpnstatus.dart';
import 'package:vpnplaylist/widgets/Connectionbutton.dart';
import 'package:vpnplaylist/widgets/widgetsaroundconnect.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final HomeControll = Get.put(homeController());
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
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.perm_device_info)),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 2 widgets
        Obx(() =>   Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundWidget(
                  title:
                      widget.HomeControll.vpnservermod.value.countryname.isEmpty
                          ? "Location"
                          : widget.HomeControll.vpnservermod.value.countryname,
                  subtitle: "Free",
                  IconFile: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: widget
                            .HomeControll.vpnservermod.value.countryname.isEmpty
                        ? Icon(Icons.flag_circle)
                        : null,
                    backgroundImage: widget
                            .HomeControll.vpnservermod.value.countryname.isEmpty
                        ? null
                        : AssetImage(
                            "countryFlags/${widget.HomeControll.vpnservermod.value.countryShortName.toLowerCase()}.png"),
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
),
          // connection button
          ConnectionButton(),

          // 2 widgets

StreamBuilder<vpnstatus?>(initialData: vpnstatus(), stream: VpnEngine.snapshotvpnstatus(),builder: (context, datasnapshot){
  return           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundWidget(
                  title: "${datasnapshot.data?.bytein ?? '0kbps'} ",
                  subtitle: "Download",
                  IconFile: CircleAvatar(
                    child: Icon(Icons.flag_circle),
                    backgroundColor: Colors.green,
                  )),
              RoundWidget(
                  title: "${datasnapshot.data?.byteout ?? '0kbps'}",
                  subtitle: "Upload",
                  IconFile: CircleAvatar(
                    child: Icon(Icons.flag_circle),
                    backgroundColor: Colors.green,
                  )) // connection button
            ],
          );
},)
        ],
      ),
    );
  }
}
