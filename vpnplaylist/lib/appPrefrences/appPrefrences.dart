
import 'package:hive_flutter/hive_flutter.dart';


class AppPrefrences{
  static late Box boxofdata;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    boxofdata = await Hive.openBox("data");
  }
  static bool get ismodedark => boxofdata.get("ismodedark") ?? false; 
  static set ismodedark(bool value) => boxofdata.put("ismodedark", value);
}