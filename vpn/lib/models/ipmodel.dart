class ipmodel{
  late final String countryname;
  late final String regionname;
  late final String cityname;
  late final String zipcode;
  late final String timezone;
  late final String isp;
  late final String query;

  ipmodel({required this.isp,required this.cityname , required this.countryname , required this.query , required this.regionname , required this.timezone , required this.zipcode});

  ipmodel.fromMap(Map<String,dynamic> map){
    countryname = map["country"];
    regionname = map["regionName"];
    cityname = map["city"];
    zipcode = map["Zip"];
    timezone = map["timezone"];
    isp = map["isp"];
      query = map["query"];
  }



}