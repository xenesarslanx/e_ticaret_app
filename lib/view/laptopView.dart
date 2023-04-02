import 'package:e_ticaret_app/database/concrete/firebase.dart';
import 'package:e_ticaret_app/modelView/laptopManager.dart';
import 'package:e_ticaret_app/widgets/appBarWidgets.dart';
import 'package:e_ticaret_app/widgets/bottomSheet.dart';
import 'package:e_ticaret_app/widgets/favoriteAndCartAddMethot.dart';
import 'package:flutter/material.dart';

import 'cartView.dart';
import 'favoritesView.dart';

class LaptopView extends StatefulWidget {
  const LaptopView({super.key});

  @override
  State<LaptopView> createState() => _LaptopViewState();
}

class _LaptopViewState extends State<LaptopView> {
  LaptopManager laptopManager = LaptopManager(FirebaseDb());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(context, const Text("Laptoplar"), const FavoritesView(), const CartView()),
      body: FutureBuilder(
          future: laptopManager.getLaptop(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final gelenVeri = snapshot.data!;
print(gelenVeri[0].fiyat);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      //Ürün Detayı Görüntüler
    myBottomSheet(context, gelenVeri[index].resim.toString(), gelenVeri[index].isim.toString(), 
    "${gelenVeri[index].ram.toString()}GB Ram",
     gelenVeri[index].fiyat.toString(), Align(alignment: Alignment.bottomLeft, child: Padding(
       padding: const EdgeInsets.all(14.0),
       child: Text(gelenVeri[index].ekranKarti.toString(),style: const TextStyle(fontSize: 20),),
     )),);
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.all(15),
                      elevation: 40,
                      shadowColor: Colors.greenAccent,
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.bottomRight,
                                  image: NetworkImage(
                                      gelenVeri[index].resim.toString()
                                      
                                      ),
                                  fit: BoxFit.contain),
                            ),
                            child: Row(children: [
                              Text("${gelenVeri[index].isim} \n\n"
                                  "${gelenVeri[index].ekranKarti} \n\n "
                                  "${gelenVeri[index].ram}GB Ram \n \n"
                                  "${gelenVeri[index].fiyat} TL \n "),
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
                                  sepetGuncelle(gelenVeri, index, "laptoplar");
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
                          favoriGuncelle(gelenVeri, index, "laptoplar");
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