import 'package:e_ticaret_app/database/concrete/firebase.dart';
import 'package:e_ticaret_app/modelView/getFavoriManager.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoriler")),
      body: FutureBuilder(
        future: FavoriManager(FirebaseDb()).getFav("enes"),
        builder: (context, snapshot) {
          return snapshot.data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var gelenVeri = snapshot.data;
                    return Column(
                      children: [
                        Card(
                          elevation: 40,
                          shadowColor: Colors.grey,
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.all(15),
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(gelenVeri![index]['resim']),
                                  fit: BoxFit.contain),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("${gelenVeri[index]['isim']} \n\n"
                                  "${gelenVeri[index]['fiyat'].toString()} TL \n "),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
