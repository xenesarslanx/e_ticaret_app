/*import 'package:e_ticaret_app/model/telefonModel.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
 TelefonModel? gelenVeri;

   Details(this.gelenVeri, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Detaylar ${gelenVeri!.docId}"),
         backgroundColor: Colors.black,
        ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
      children:  [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image(
          image: NetworkImage(gelenVeri!.resim.toString()),
        ),
      ),
      gelenVeri == null ? const Text("data yok") :
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${gelenVeri!.isim} ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
       Text(
       "${gelenVeri!.telModel} \n",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
       Text(
      "${gelenVeri!.fiyat} TL", 
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      ],
    ),
    ),
    );
  }
}*/