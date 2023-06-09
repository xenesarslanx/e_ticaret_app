import 'package:e_ticaret_app/database/concrete/firebase.dart';
import 'package:e_ticaret_app/modelView/categoriesManager.dart';
import 'package:e_ticaret_app/modelView/userManager.dart';
import 'package:e_ticaret_app/view/cartView.dart';
import 'package:e_ticaret_app/view/favoritesView.dart';
import 'package:e_ticaret_app/view/loginView.dart';
import 'package:e_ticaret_app/widgets/appBarWidgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class KategoriSayfasi extends StatefulWidget {
  const KategoriSayfasi({super.key});


  @override
  State<KategoriSayfasi> createState() => _KategoriSayfasiState();
}

class _KategoriSayfasiState extends State<KategoriSayfasi> {
   CategoriesManager categoriesManager = CategoriesManager(FirebaseDb());
   // final UserManager c = Get.find();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMethod(context,  FutureBuilder<List<Map<String, dynamic>>>(
    future: UserManager().getUserList(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
       var userNameList = snapshot.data;
     print(userNameList![0]["ad"]);
     
        return TextButton(
          onPressed: () async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("userList");
              print("çıkış");
               Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      );
          },
         child: Text("Çıkış Yap- ${userNameList[0]["ad"]}", style: const TextStyle(fontSize: 18,color: Colors.red),));
      } else {
        return const CircularProgressIndicator();
      }
    },
  ),const FavoritesView(), const CartView(), ),
        body: FutureBuilder(
          future: categoriesManager.getKategori(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
           final datam = snapshot.data;
      return ListView.builder(
                itemCount: datam!.length,
                itemBuilder: (BuildContext context, int index) {
         return   InkWell(
              onTap: (){
                //sayfa yönlendirmesi
     categoriesManager.kategoriSec(datam[index].name.toString(), context);
                
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(15),
                elevation: 40,
                shadowColor: Colors.greenAccent,
                
                child: Container(
                  height: 200,
                  width: 150,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(datam[index].image.toString()),
                      fit: BoxFit.contain),
                  ),
                  
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(datam[index].name.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w900),
                    )
                    ),
                
                ),
              ),
            );
            
          },
        );
            }else if (snapshot.hasError) {
              return Center(
                child: Text('Bir hata oluştu: ${snapshot.error}'),
              );
            }return const CircularProgressIndicator();
        
        }
        
        )
        
      );
    
  }
}