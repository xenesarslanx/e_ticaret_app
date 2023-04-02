import 'package:e_ticaret_app/database/concrete/firebase.dart';
import 'package:e_ticaret_app/modelView/telefonManager.dart';
import 'package:e_ticaret_app/view/cartView.dart';
import 'package:e_ticaret_app/view/favoritesView.dart';
import 'package:e_ticaret_app/widgets/appBarWidgets.dart';
import 'package:e_ticaret_app/widgets/bottomSheet.dart';
import 'package:e_ticaret_app/widgets/favoriteAndCartAddMethot.dart';
import 'package:flutter/material.dart';

class Telefon extends StatefulWidget {
  const Telefon({super.key});

  @override
  State<Telefon> createState() => _TelefonState();
}

class _TelefonState extends State<Telefon> {
  TelefonManager telefonManager = TelefonManager(FirebaseDb());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Sepet ve Favori appBar
      appBar: appBarMethod(context, const Text("Telefonlar"), const FavoritesView(), const CartView()),

      body: FutureBuilder(
          future: telefonManager.getPhone(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final gelenVeri = snapshot.data!;

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      //Ürün Detayı Görüntüler
                      myBottomSheet(context, gelenVeri[index].resim.toString(), gelenVeri[index].isim.toString(), gelenVeri[index].telModel.toString(), gelenVeri[index].fiyat.toString(), const SizedBox());
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.all(15),
                      elevation: 40,
                      shadowColor: Colors.greenAccent,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      gelenVeri[index].resim.toString()),
                                  fit: BoxFit.contain),
                            ),
                            child: Row(children: [
                              Text("${gelenVeri[index].isim} \n\n"
                                  "${gelenVeri[index].telModel.toString()} \n\n "
                                  "${gelenVeri[index].fiyat.toString()} TL \n "),
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.shopping_basket_sharp,
                                  color: gelenVeri[index].sepet == false
                                      ? Colors.black
                                      : Colors.orange,
                                ),
                                onTap: () { //sepete ekle sil
                                  setState(() {
                                  sepetGuncelle(gelenVeri, index, "telefonlar");
                                  sepetEkleSil(gelenVeri, index, "enes");

                                  });

                                },
                              )
                            ],
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.favorite,
                                color: gelenVeri[index].icon == false
                                    ? Colors.black
                                    : Colors.red,
                              ),
                              onTap: () { //favori ekle sil
                              setState(() {
                          favoriGuncelle(gelenVeri, index, "telefonlar");
                          favoriEkleSil(gelenVeri, index, "enes");       
                              });

                              },
                            ),
                          ],
                        ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Bir hata oluştu: ${snapshot.error}'),
              );
            }
            return const Text("");
          }),
    );
  }
  }

 

