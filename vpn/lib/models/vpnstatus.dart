class vpnstatus{
  String? bytein;
  String? byteout;
  String? durationtime;
  String? lastpacket;

  vpnstatus({ this.bytein ,  this.byteout ,  this.durationtime ,  this.lastpacket});

  vpnstatus.fromMap(Map<String,dynamic> map){
    bytein = map["byte_in"];
    byteout = map["byte_out"];
    durationtime = map["duration"];
    lastpacket = map["last_packet_receive"];
  }

 Map<String,dynamic> tomap(){
  return {
"byte_in" : bytein,
"byte_out" : byteout,
"duration" : durationtime,
"last_packet_receive" : lastpacket
  };
 }
}