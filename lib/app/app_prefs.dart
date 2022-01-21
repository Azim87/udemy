import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy/res/language.dart';

const String PREFS_LANG_KEY = 'PREFS_LANG_KEY';

class AppPreferences {
  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

  Future<String> getAppLanguage() async {
    String? lang = _preferences.getString(PREFS_LANG_KEY);
    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageType.English.getLanguageValue();
    }
  }
}
