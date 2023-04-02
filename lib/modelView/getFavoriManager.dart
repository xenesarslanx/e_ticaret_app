import 'package:e_ticaret_app/database/abstract/IDatabase.dart';

class FavoriManager{

FavoriManager(IDatabase db){
  database = db;
}
IDatabase? database;

 Future<List<Map<String, dynamic>>> getFav(String kullaniciAdi) async{
  return await database!.getFav(kullaniciAdi);
  }

   addFavOrCart(String koleksiyonAdi, kullaniciAdi, String isim, fiyat, resim, docId) async{
    await database!.addFavOrCart(koleksiyonAdi, kullaniciAdi, isim, fiyat, resim, docId);
   }
}