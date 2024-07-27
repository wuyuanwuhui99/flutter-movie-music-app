import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/constant.dart';

class LocalStorageUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //从缓存中获取token
  static Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    String token = prefs.getString(TOKEN_STORAGE_KEY) ?? '';
    // 测试数据
    if(token != ''){
      bool hasExpired = JwtDecoder.isExpired(token);
      if(!hasExpired){
        return token;
      }else{
        return '';
      }
    }else{
      return '';
    }
  }

  //保存token
  static Future setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(TOKEN_STORAGE_KEY, token);
  }
}
