import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_app/model/productsModel.dart';

class TabletModel implements IProduct{
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

  bool hasSimKart;

TabletModel({this.fiyat, this.isim, this.resim, this.docId, this.icon, this.renk, this.sepet, this.sepetrenk, required this.hasSimKart});

 factory TabletModel.fromFirestore(DocumentSnapshot doc) {
  Map data = doc.data() as Map<String, dynamic>;
  return TabletModel(
    fiyat : data['fiyat'],
    isim : data['isim'],
    resim: data['resim'],
    docId: data['docId'],
    icon: data['icon'],
    renk: data['renk'],
    sepet: data['sepet'],
    sepetrenk: data['sepetrenk'],
    hasSimKart: data['hasSimKart'],
  );
}

}