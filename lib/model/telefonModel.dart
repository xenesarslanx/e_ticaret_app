import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_app/model/productsModel.dart';

class TelefonModel implements IProduct{
  @override
  String? fiyat;

  @override
  String? docId;

  @override
  bool? icon;
  
  @override
  String? isim;

  @override
  String? resim;

  @override
  String? renk;
  
  @override
  bool? sepet;
  
  @override
  String? sepetrenk;


String? telModel;

TelefonModel({this.fiyat, this.isim, this.resim, this.telModel, this.docId, this.icon, this.renk, this.sepet, this.sepetrenk});

 factory TelefonModel.fromFirestore(DocumentSnapshot doc) {
  Map data = doc.data() as Map<String, dynamic>;
  return TelefonModel(
    fiyat : data['fiyat'],
    isim : data['isim'],
    resim: data['resim'],
    telModel: data['telModel'],
    docId: data['docId'],
    icon: data['icon'],
    renk: data['renk'],
    sepet: data['sepet'],
    sepetrenk: data['sepetrenk'],);
}



}

