


import 'package:app_template/presentation/infraestructure/services/key_value_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService{

  Future<SharedPreferences> getSharedPrefs() async{
    return await SharedPreferences.getInstance();
  }
 
  @override
  Future<T?> getValue<T>(String key) async {
    final pref = await getSharedPrefs();
    
    switch (T) {
      case int: 
       return pref.getInt(key) as  T?;

      case String: 
      return pref.getString(key) as T?;

      case bool:
        return pref.getBool(key) as T?;
        
      default: 
        throw UnimplementedError('Set not implemente for Type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final pref = await getSharedPrefs();
    return await pref.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final pref = await getSharedPrefs();
    
    switch (T) {
      case int: 
        pref.setInt(key, value as int);
      break;
      case String: 
        pref.setString(key, value as String);
      break;
      case bool:
        pref.setBool(key, value as bool);
      break;
      default: 
        throw UnimplementedError('Set not implemente for Type ${T.runtimeType}');
    }
    
  }

}