import 'package:e_ticaret_app/database/concrete/firebase.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim"),),
      body: FutureBuilder(
        future: FirebaseDb().getCart("enes"),
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
                                  "${gelenVeri[index]['fiyat']} TL \n "),
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