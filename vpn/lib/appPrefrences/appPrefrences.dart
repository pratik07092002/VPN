
import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpnplaylist/models/vpnservermodel.dart';


class AppPrefrences{
  static late Box boxofdata;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    boxofdata = await Hive.openBox("data");
  }
  static bool get ismodedark => boxofdata.get("ismodedark") ?? false; 
  static set ismodedark(bool value) => boxofdata.put("ismodedark", value);

  static VPNServerMod get vpninfo => VPNServerMod.fromMap(jsonDecode(boxofdata.get("vpn")??"{}"));
  static set vpninfo(VPNServerMod value) => boxofdata.put("vpn", jsonEncode(value));

  static List<VPNServerMod> get vpnList{
    List<VPNServerMod> UpdateList = [];
    final dataVpn = jsonDecode(boxofdata.get("vpnList")??'[]');

    for(var data in dataVpn){
      UpdateList.add(VPNServerMod.fromMap(data));
    }

    return UpdateList;
  }

  static set vpnList(List<VPNServerMod> valueList) => boxofdata.put("vpnList" , valueList);
}