import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_app/model/productsModel.dart';

class LaptopModel implements IProduct{
  @override
  String? docId;

  @override
  String? fiyat;

  @override
  bool? icon;

  @override
  String? isim;

  @override
  String? renk;

  @override
  String? resim;

  @override
  bool? sepet;

  @override
  String? sepetrenk;
  
  String? ram;

  String? ekranKarti;

 LaptopModel({this.fiyat, this.isim, this.resim, this.docId, this.icon, this.renk, this.sepet, this.sepetrenk, required this.ekranKarti, required this.ram});

 factory LaptopModel.fromFirestore(DocumentSnapshot doc) {
  Map data = doc.data() as Map<String, dynamic>;
  return LaptopModel(
    fiyat : data['fiyat'],
    isim : data['isim'],
    resim: data['resim'],
    docId: data['docId'],
    icon: data['icon'],
    renk: data['renk'],
    sepet: data['sepet'],
    sepetrenk: data['sepetrenk'],
    ekranKarti: data['ekranKarti'],
    ram: data['ram'],
  );
}
}