
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref
{
  Future<void> getGata()
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('intro', true);
  }
  Future<bool?> Readdata()
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? status =shr.getBool('intro');
    return status;
  }
}
