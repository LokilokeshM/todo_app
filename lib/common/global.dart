import 'package:shared_preferences/shared_preferences.dart';

class Global {
  final SharedPreferences _pref;

  static late final Global _instance;

  static Global getInstance() => _instance;

  static Future<void> init(SharedPreferences pref) async {
    _instance = Global._(pref);
  }

  Global._(this._pref);

  List<String>? _todo;

  set todo(List<String>? todo) {
    _todo = todo;
    _pref.setStringList('todo', todo!);
  }

  List<String>? get todo => _pref.getStringList('todo');
}
