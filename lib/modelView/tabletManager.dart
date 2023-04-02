import 'package:e_ticaret_app/database/abstract/IDatabase.dart';
import 'package:e_ticaret_app/model/tabletModel.dart';

class TabletManager{

  IDatabase? database;

TabletManager(IDatabase db){
  database = db;
}


  Future<List<TabletModel>> getTablet() async{
   List<TabletModel> tabletList = await database!.getUrunGeneric("tabletler", (doc) => TabletModel.fromFirestore(doc)) ;
   return tabletList;
}
}