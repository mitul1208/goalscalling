import 'package:shared_preferences/shared_preferences.dart';

Future<String> getId() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.get("id");
}

Future<String> getEmail() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.get("email");
}

Future<String> getName() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.get("name");
}

Future<String> getImage() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.get("image");
}
