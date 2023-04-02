import 'package:e_ticaret_app/database/concrete/firebase.dart';
import 'package:e_ticaret_app/modelView/getFavoriManager.dart';

sepetGuncelle(gelenVeri, int index, String koleksiyonAdi){
       gelenVeri[index].sepetrenk == "black"
                                      ? FirebaseDb().updateDocSepet(koleksiyonAdi, true, "orange", gelenVeri[index].docId.toString())
                                      : FirebaseDb().updateDocSepet(koleksiyonAdi, false, "black", gelenVeri[index].docId.toString());
  }
  
  sepetEkleSil(gelenVeri, int index, String user){
     gelenVeri[index].sepetrenk == "black"
        ? FavoriManager(FirebaseDb()).addFavOrCart('sepet', user, gelenVeri[index].isim.toString(), gelenVeri[index].fiyat, gelenVeri[index].resim, gelenVeri[index].docId)
        : (FirebaseDb()).favDelete('users', user, "sepet", gelenVeri[index].docId);
  }

  favoriGuncelle(gelenVeri, int index, String koleksiyonAdi){
     gelenVeri[index].renk == "black"
                            ? FirebaseDb().updateDocFav(koleksiyonAdi, true, "red", gelenVeri[index].docId.toString())
                            : FirebaseDb().updateDocFav(koleksiyonAdi, false, "black", gelenVeri[index].docId.toString());
  }

  favoriEkleSil(gelenVeri, int index, String user){
    gelenVeri[index].renk == "black"
         ? FavoriManager(FirebaseDb()).addFavOrCart('favoriler', user, gelenVeri[index].isim.toString(), gelenVeri[index].fiyat, gelenVeri[index].resim, gelenVeri[index].docId)
         : (FirebaseDb()).favDelete('users', user, "favoriler", gelenVeri[index].docId);
  }