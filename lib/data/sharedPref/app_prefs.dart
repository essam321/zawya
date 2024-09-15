import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {



  void setGameState({required String gameName,required bool state})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(gameName, state);
  }

  Future<bool> loadGameState({required String gameName})async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     bool state= preferences.getBool(gameName) ?? true;
     return state;
  }

}
