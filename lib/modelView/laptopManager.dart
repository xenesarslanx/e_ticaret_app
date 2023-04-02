import 'package:e_ticaret_app/database/abstract/IDatabase.dart';
import 'package:e_ticaret_app/model/laptopModel.dart';

class LaptopManager{

  IDatabase? database;

LaptopManager(IDatabase db){
  database = db;
}


  Future<List<LaptopModel>> getLaptop() async{
   List<LaptopModel> laptopList = await database!.getUrunGeneric("laptoplar", (doc) => LaptopModel.fromFirestore(doc)) ;
   return laptopList;
}
}