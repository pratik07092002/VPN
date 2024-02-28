import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/controllers/homecontroller.dart';
import 'package:vpnplaylist/main.dart';

class ConnectionButton extends StatelessWidget {
   ConnectionButton({super.key});
  final HomeControll = Get.put(homeController());
  @override
  Widget build(BuildContext context) {
    ScreenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Semantics(
          button: true,
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(80),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(shape: BoxShape.circle, color: HomeControll.getbuttoncolor ),
              
             child:  Container(
              padding: const EdgeInsets.all(20),
              decoration:  BoxDecoration(shape: BoxShape.circle , color: HomeControll.getbuttoncolor),
              
             child: Container(
              height: ScreenSize.height*0.15,
              width: ScreenSize.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HomeControll.getbuttoncolor

              ),
              
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.power_settings_new, size: 40),
                  SizedBox(height: 4,),
                  Text(HomeControll.getbuttontext)
                ],
              ),
             )
            ),
            ),
          ),
        )
      ]
    );
  }
}