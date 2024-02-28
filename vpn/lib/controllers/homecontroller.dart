import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/appengine/vpnengine.dart';
import 'package:vpnplaylist/models/vpnconfig.dart';
import 'package:vpnplaylist/models/vpnservermodel.dart';

class homeController extends GetxController{
  final Rx<VPNServerMod> vpnservermod = AppPrefrences.vpninfo.obs;
  final vpnconnectionstate = VpnEngine.vpndisconnected.obs;

  void ConnectToVpn() async{
    if(vpnservermod.value.base640vpnconfig.isEmpty){
      Get.snackbar("Country / location", "Please select Location");

      return;
    }

    if(vpnconnectionstate.value == VpnEngine.vpndisconnected){
      final datavpn = Base64Decoder().convert(vpnservermod.value.base640vpnconfig);
      final configuration = Utf8Decoder().convert(datavpn);
      final VpnConfiguration = configvpn(username:
       "vpn", password: "vpn",
        country: vpnservermod.value.countryname, config: configuration);
   await VpnEngine.startvpn(VpnConfiguration);
    }else{
      await VpnEngine.stopvpn();
    }
   
  }

Color get getbuttoncolor{
  switch(vpnconnectionstate.value){
    case VpnEngine.vpndisconnected:
    return Colors.green;
    case VpnEngine.vpnconnected:
    return Colors.black;
    default :
    return Colors.red;
  }
}

String get getbuttontext{
  switch(vpnconnectionstate.value){
    case VpnEngine.vpndisconnected:
    return "Tap to Connect";
    case VpnEngine.vpnconnected:
    return "Disconnected";
    default :
    return "Connecting...";
  }
}

}