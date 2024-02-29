
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vpnplaylist/controllers/vpn_controllers.dart';
import 'package:vpnplaylist/widgets/vpn_card.dart';

class SelectLocation extends StatefulWidget {
   SelectLocation({super.key});
final VpnLocation = vpncontroller();
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  
 loadingUI(){
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),

      ),
      SizedBox(height: 8,),
      Text("Gathering Vpn Locations", style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),)
      
      ],
    ),
  );
 }
noServer(){
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
      SizedBox(height: 8,),
      Center(
        child: Text("No VPN Available", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      )
      
      ],
    ),
  );
}
ServerData(){
return ListView.builder( itemCount: widget.VpnLocation.vpnserverlist.length 
,physics: BouncingScrollPhysics() ,
padding: EdgeInsets.all(3),
itemBuilder: (context,index){
return VpnCard(vpnservermod: widget.VpnLocation.vpnserverlist[index]);
});
}
  @override
  Widget build(BuildContext context) {
  if(widget.VpnLocation.vpnserverlist.isEmpty){
    widget.VpnLocation.retrivevpninfo();
  }
  
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: Text("VPN Locations"),

      ),
      body: widget.VpnLocation.isLoadingNewLocation.value
       ? loadingUI() 
       : widget.VpnLocation.vpnserverlist.isEmpty
       ? noServer()
       : ServerData()
    ));
  }
}