import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_app/database/abstract/IDatabase.dart';

class FirebaseDb implements IDatabase {
  FirebaseFirestore instance = FirebaseFirestore.instance;
  @override
  add() {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
 Future<void> favDelete(String koleksiyonAdi, kullaniciAdi, koleksiyonAdi2, docId) async{
 var ref = await FirebaseFirestore
   .instance
   .collection(koleksiyonAdi)
   .doc(kullaniciAdi)
   .collection(koleksiyonAdi2)
   .doc(docId)
   .delete();
   print("silindi");
   return ref;
  }

  @override
 Future<List<Map<String, dynamic>>> get(String koleksiyonAdi) async{
 
      List<Map<String, dynamic>> documents = [];
   await FirebaseFirestore.instance
        .collection(koleksiyonAdi)
        .get()
        .then((querySnapshot) {
      for (int i = 0; i< querySnapshot.docs.length; i++) {
      //  print(querySnapshot.docs[i].data());
     Map<String, dynamic> data = querySnapshot.docs[i].data();
     documents.add(data);
      }
    });
    return documents;
  }
 
  @override
  Future<List<T>> getUrunGeneric<T>(String collectionName, T Function(DocumentSnapshot doc) fromFirestore) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore
  .instance
  .collection(collectionName)
  .get();
  List<T> urunler = querySnapshot.docs.map((doc) => fromFirestore(doc)).toList();
  
  
  return urunler;
}
  
  @override
  addFavOrCart(String koleksiyonAdi, kullaniciAdi, String isim, fiyat, resim, docId) async{
    // users dokümanına erişmek için referans oluşturuyoruz
  final kullaniciRef = FirebaseFirestore.instance.collection('users').doc(kullaniciAdi);
  
  // koleksiyonu eklemek için referans oluşturuyoruz
  final productRef = kullaniciRef.collection(koleksiyonAdi);
  
  // ürün verilerini tanımlıyoruz
  final productData = {
    'isim': isim,
    'fiyat': fiyat,
    'resim': resim,
  };
  
  // dokümanı eklemek için referans oluşturuyoruz
  final productIdRef = productRef.doc(docId);
  
  //verileri dokümana kaydediyoruz
  await productIdRef.set(productData);
  print("addFav ekleme başarılı");
  }

  @override
  Future<List<Map<String, dynamic>>> getFav(String kullaniciAdi) async {

      List<Map<String, dynamic>> favoriList = [];

   await FirebaseFirestore.instance
      .collection('users')
      .doc(kullaniciAdi)
      .collection('favoriler')
    //  .doc(docId)
      .get()
      .then((querySnapshot) {
     for (int i = 0; i< querySnapshot.docs.length; i++) {
     Map<String, dynamic> data = querySnapshot.docs[i].data();
     favoriList.add(data);
      }
      });
      print(favoriList);
  return favoriList;
}
@override
  Future<List<Map<String, dynamic>>> getCart(String kullaniciAdi) async {

      List<Map<String, dynamic>> sepetList = [];

   await FirebaseFirestore.instance
      .collection('users')
      .doc(kullaniciAdi)
      .collection('sepet')
    //  .doc(docId)
      .get()
      .then((querySnapshot) {
     for (int i = 0; i< querySnapshot.docs.length; i++) {
     Map<String, dynamic> data = querySnapshot.docs[i].data();
     sepetList.add(data);
      }
      });
      print(sepetList);
  return sepetList;
}

  @override
  Future<void> updateDocFav(String koleksiyonAdi, bool text, String renk, String docu) async{
 try{
  await FirebaseFirestore.instance
    .collection(koleksiyonAdi)
    .doc(docu)
    .update({
   'icon': text,
   'renk': renk,
    });
print('favoriler başarıyla güncellendi.');
 } catch(e){"hataaa: $e.toString()";}
  }

@override
  Future<void> updateDocSepet(String koleksiyonAdi, bool text, String renk, String docu) async{
 try{
  await FirebaseFirestore.instance
    .collection(koleksiyonAdi)
    .doc(docu)
    .update({
   'sepet': text,
   'sepetrenk': renk,
    });
print('Sepet başarıyla güncellendi.');
 } catch(e){"hataaa: $e.toString()";}
  }

}
