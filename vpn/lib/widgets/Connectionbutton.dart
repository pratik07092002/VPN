import 'package:flutter/material.dart';
import 'package:vpnplaylist/main.dart';

class ConnectionButton extends StatelessWidget {
  const ConnectionButton({super.key});

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
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green ),
              
             child:  Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(shape: BoxShape.circle , color: Colors.green),
              
             child: Container(
              height: ScreenSize.height*0.15,
              width: ScreenSize.width * 0.15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green

              ),
              
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.power_settings_new, size: 40),
                  SizedBox(height: 4,),
                  Text("Connect")
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