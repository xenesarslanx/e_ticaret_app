import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IDatabase{

add();
Future<void> favDelete(String koleksiyonAdi, kullaniciAdi, koleksiyonAdi2, docId);
Future<List<Map<String, dynamic>>> get(String koleksiyonAdi);
addFavOrCart(String koleksiyonAdi, kullaniciAdi, String isim, fiyat, resim, docId);
Future<List<Map<String, dynamic>>> getFav(String kullaniciAdi);
Future<List<Map<String, dynamic>>> getCart(String kullaniciAdi);
 Future<void> updateDocFav(String koleksiyonAdi, bool text, String renk, String docu);
 Future<void> updateDocSepet(String koleksiyonAdi, bool text, String renk, String docu);
  Future<List<T>> getUrunGeneric<T>(String collectionName, T Function(DocumentSnapshot doc) fromFirestore);
}