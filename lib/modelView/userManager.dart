import 'dart:convert';
import 'package:e_ticaret_app/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserManager {
 List<User> userList = [];

  isimAl(String isim, yas) async{
   userList.add(User(isim, yas));
    final prefs = await SharedPreferences.getInstance();
   List userListMap = userList.map((user) => user.toMap()).toList();
  await prefs.setString('userList', jsonEncode(userListMap));
  }
  
 Future<List<Map<String, dynamic>>> getUserList() async {
SharedPreferences prefs = await SharedPreferences.getInstance();
String? userListJson = prefs.getString('userList');
if (userListJson == null) {
  print("boş");
return [];
}
List<Map<String, dynamic>> userListMap = List<Map<String, dynamic>>.from(jsonDecode(userListJson));
print(userListMap);
return userListMap;
}



}

