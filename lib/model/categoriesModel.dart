
import 'package:cloud_firestore/cloud_firestore.dart';

class Kategoriler{
  String? name;
  String? image; 

  Kategoriler({ this.name, this.image});

 factory Kategoriler.fromFirestore(DocumentSnapshot doc) {
  Map data = doc.data() as Map<String, dynamic>;
  return Kategoriler(
    name: data['name'],
    image: data['image'],
  );
}
}