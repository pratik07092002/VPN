import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/appPrefrences/appPrefrences.dart';
import 'package:vpnplaylist/models/ipmodel.dart';
import 'package:vpnplaylist/models/vpnservermodel.dart';
import 'package:http/http.dart' as http;
class vpnapi{
  static Future<List<VPNServerMod>> VPNServers() async{
    final List<VPNServerMod> serverList = [];
  try{
final ResponseFAPI = await http.get(Uri.parse("https://www.vpngate.net/api/iphone/"));
final commasepratedvaluesstring = ResponseFAPI.body.split("#")[1].replaceAll("*", "");

List<List<dynamic>> listdata = const CsvToListConverter().convert(commasepratedvaluesstring);

final header = listdata[0];

for (int i = 1; i < listdata.length -1; i++) {
  Map<String,dynamic> Data = {};
  for (int j = 0; j < header.length-1; j++) {
    Data.addAll({header[j].toString(): listdata[i][j]});
  }
  serverList.add(VPNServerMod.fromMap(Data));
}
  }
  catch(error){
    Get.snackbar("Error occured", error.toString());
  }
serverList.shuffle();
if(serverList.isNotEmpty){
  AppPrefrences.vpnList = serverList;
}
return serverList;
  }

static Future<void> retriveipdetails({required Rx<ipmodel> ipinformation}) async{
try{
final ResponsefromApi = await http.get(Uri.parse("http://ip-api.com/json/"));
final datafrommapi = jsonDecode(ResponsefromApi.body);

ipinformation.value = ipmodel.fromMap(datafrommapi);
}catch(error){
  Get.snackbar("Error occured", error.toString());
}
}
}