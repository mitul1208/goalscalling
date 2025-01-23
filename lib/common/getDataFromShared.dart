import 'package:shared_preferences/shared_preferences.dart';

Future<String> getId() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("id") ?? "";
}

Future<String> getEmail() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("email") ?? "";
}

Future<String> getName() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("name") ?? "";
}

Future<String> getImage() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("image") ?? "";
}
