import 'package:e_ticaret_app/database/abstract/IDatabase.dart';
import 'package:e_ticaret_app/model/categoriesModel.dart';
import 'package:e_ticaret_app/view/laptopView.dart';
import 'package:e_ticaret_app/view/tabletView.dart';
import 'package:e_ticaret_app/view/telefonView.dart';
import 'package:flutter/material.dart';

class CategoriesManager{
 IDatabase? database;

CategoriesManager(IDatabase db){
  database = db;
}
  /*static List<Kategoriler> kategorilerim = [
    Kategoriler(name: 'telefon', image: 'https://productimages.hepsiburada.net/s/268/300-443/110000254069925.jpg'),
    Kategoriler(name: 'kıyafet', image: 'https://productimages.hepsiburada.net/s/268/300-443/110000254069925.jpg'),
    Kategoriler(name: 'laptop', image: 'https://productimages.hepsiburada.net/s/268/300-443/110000254069925.jpg'),
    Kategoriler(name: 'kırtasiye', image: 'https://productimages.hepsiburada.net/s/268/300-443/110000254069925.jpg'),
    ];*/

  Future<List<Kategoriler>> getKategori() async{
   List<Kategoriler> kategoriList = await database!.getUrunGeneric("kategoriler", (doc) => Kategoriler.fromFirestore(doc)) ;
   return kategoriList;
}

kategoriSec(String sec, context){
      sec; 
   switch(sec) { 
      case "Telefonlar": {   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Telefon()),
            ); } 
      break; 
     
      case "Tabletler": {      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TabletView()),
            ); } 
      break; 
     
      case "Laptoplar": {  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LaptopView()),
            );} 
      break; 
     
       
     
      default: { print("Geçersiz Seçim"); } 
      break; 
   } 
}
    
}