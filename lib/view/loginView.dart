import 'package:e_ticaret_app/modelView/userManager.dart';
import 'package:e_ticaret_app/view/categoriesView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController textFieldKayit = TextEditingController();
  bool check = false;
    final UserManager c = Get.put(UserManager());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText:
                      "isim", 
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
                  border:
                      OutlineInputBorder() 
                  ),
              controller: textFieldKayit,
            
              onEditingComplete: () {
                c.isimAl(textFieldKayit.text);
                 print(c.userList[0].ad);
                 check = true;
              },
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
             check == false ? const SizedBox() : 
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KategoriSayfasi()),
            );
            },
             child: const Text("Giriş Yap"))
        ],
      ),
    );
  }
}
