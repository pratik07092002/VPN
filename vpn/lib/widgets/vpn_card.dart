
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/controllers/homecontroller.dart';
import 'package:vpnplaylist/main.dart';
import 'package:vpnplaylist/models/vpnservermodel.dart';

class VpnCard extends StatefulWidget {
  final VPNServerMod vpnservermod;
  const VpnCard({super.key , required this.vpnservermod});

  @override
  State<VpnCard> createState() => _VpnCardState();
}

class _VpnCardState extends State<VpnCard> {
  @override
  Widget build(BuildContext context) {
    ScreenSize = MediaQuery.of(context).size;
    final HomeControll = Get.find<homeController>();
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: ScreenSize.height *0.02 ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          leading: Container(
            padding: EdgeInsets.all(0.4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Image.asset("countryFlags/${widget.vpnservermod.countryShortName.toLowerCase()}.png", height: 30, width: ScreenSize.width *0.15, fit: BoxFit.cover,),
            
          ),
          title: Text(widget.vpnservermod.countryname.toString())
        ),
      ),
    );
  }
}