import 'package:get/get.dart';
import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/models/vpnservermodel.dart';
import 'package:vpnplaylist/vpnlist/vpnservers.dart';

class vpncontroller extends GetxController{
  List<VPNServerMod> vpnserverlist = AppPrefrences.vpnList;
  final RxBool isLoadingNewLocation = false.obs;
  Future<void> retrivevpninfo() async{
    isLoadingNewLocation.value = true;

    vpnserverlist.clear();
    await vpnapi.VPNServers();

    isLoadingNewLocation.value = false;
  }
}