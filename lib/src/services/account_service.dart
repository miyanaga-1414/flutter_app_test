import 'package:shared_preferences/shared_preferences.dart';

class AccountService {

  Future<void> saveAccountInfo(String mailAddress, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('mailAddress', mailAddress);
    prefs.setString('password', password);
  }

  Future<bool> login(String mailAddress, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saveMailAddress = prefs.getString('mailAddress');
    if (saveMailAddress == null || saveMailAddress != mailAddress) {
      return false;
    }

    String? savePassword = prefs.getString('password');
    if (savePassword == password) {
      prefs.setBool('login', true);
      int loginTime = DateTime.now().toUtc().millisecondsSinceEpoch;
      prefs.setInt('lastLoginTime', loginTime);
      return true;
    }

    return false;
  }

  Future<bool> isLoginConfirm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isLogin = prefs.getBool('login');
    if (isLogin == null) {
      return false;
    }

    // 最終ログインから1分経過
    DateTime now = DateTime.now();
    int? lastLoginTime = prefs.getInt('lastLoginTime');
    if (lastLoginTime != null) {
      int nowTime = DateTime.now().toUtc().millisecondsSinceEpoch;
      if (lastLoginTime + 60000 <= nowTime) {
        prefs.setBool('login', false);
        return false;
      }
    }
    return isLogin;
  }
}