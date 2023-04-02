
import 'package:e_ticaret_app/database/abstract/IDatabase.dart';
import 'package:e_ticaret_app/model/telefonModel.dart';

class TelefonManager  {
 IDatabase? database;

TelefonManager(IDatabase db){
  database = db;
}

 /*Future<List<Map<String, dynamic>>> get() async{
    return await database!.get("telefonlar");
  }*/
  

  /*Future<void> favDelete(String koleksiyonAdi, kullaniciAdi, koleksiyonAdi2, docId) async{
   return await database!.favDelete(koleksiyonAdi, kullaniciAdi, koleksiyonAdi2, docId);
  }*/

  Future<List<TelefonModel>> getPhone() async{
   List<TelefonModel> phoneList = await database!.getUrunGeneric("telefonlar", (doc) => TelefonModel.fromFirestore(doc)) ;
   return phoneList;
}
}



