class VPNServerMod{
  late final String ping;
  late final String hostname;
  late final int speed;
  late final String ip;
  late final String countryname;
  late final String countryShortName;
  late final String vpnsessionnum;
  late final String base640vpnconfig; 
VPNServerMod({required this.ping, required this.hostname , required this.speed
 ,required this.ip,required this.countryname ,required this.countryShortName ,
 required this.vpnsessionnum , required this.base640vpnconfig});

 VPNServerMod.fromMap(Map<String,dynamic> map){
  ping = map["Ping"];
  hostname = map["HostName"];
  speed = map["Speed"];
  ip = map["IP"];
  countryname = map["CountryLong"];
  countryShortName = map["CountryShort"];
  vpnsessionnum = map["NumVpnSessions"];
  base640vpnconfig = map["OpenVPN_ConfigData_Base64"];

 }
Map<String,dynamic> tomap(){
  return 
  {
   "Ping" : ping,
   "HostName" : hostname,
   "Speed" : speed,
   "IP" : ip,
   "CountryLong" : countryname,
   "CountryShort" : countryShortName,
   "NumVpnSessions" : vpnsessionnum,
   "OpenVPN_ConfigData_Base64" : base640vpnconfig
  }; 
}

}