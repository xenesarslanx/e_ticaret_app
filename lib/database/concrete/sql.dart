
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_app/database/abstract/IDatabase.dart';

class Sql implements IDatabase{
  @override
  add() {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  get(koleksiyonAdi) {
    // TODO: implement get
    throw UnimplementedError();
  }
  
  @override
  addFav(String koleksiyonAdi, kullaniciAdi, String isim, fiyat, resim, docId) {
    // TODO: implement addFav
    throw UnimplementedError();
  }
  
  @override
  Future<void> favDelete(String koleksiyonAdi, kullaniciAdi, koleksiyonAdi2, docId) {
    // TODO: implement favDelete
    throw UnimplementedError();
  }
  
  @override
  Future<List<Map<String, dynamic>>> getFav(String kullaniciAdi) {
    // TODO: implement getFav
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateDocFav(String koleksiyonAdi, bool text, String renk, String docu) {
    // TODO: implement updateDocFav
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateDocSepet(String koleksiyonAdi, bool text, String renk, String docu) {
    // TODO: implement updateDocSepet
    throw UnimplementedError();
  }
  
  @override
  addFavOrCart(String koleksiyonAdi, kullaniciAdi, String isim, fiyat, resim, docId) {
    // TODO: implement addFavOrCart
    throw UnimplementedError();
  }
  
  @override
  Future<List<Map<String, dynamic>>> getCart(String kullaniciAdi) {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<List<T>> getUrunGeneric<T>(String collectionName, T Function(DocumentSnapshot<Object?> doc) fromFirestore) {
    // TODO: implement getUrunGeneric
    throw UnimplementedError();
  }
}