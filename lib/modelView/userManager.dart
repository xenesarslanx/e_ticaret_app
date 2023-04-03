import 'package:e_ticaret_app/controller/controller.dart';
import 'package:e_ticaret_app/model/userModel.dart';
class UserManager extends Controller{

  isimAl(String isim){
   userList.add(User(isim));
  return userList;
  }
}

