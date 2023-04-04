import 'package:e_ticaret_app/modelView/userManager.dart';
import 'package:e_ticaret_app/view/categoriesView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
   Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userList = prefs.getString('userList');

    if (userList != null) {
      // Eğer kullanıcı adı ve şifre kaydedilmişse yeni sayfaya yönlendir
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const KategoriSayfasi(),
        ),
      );
    }
  }
  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  TextEditingController textFieldKayit = TextEditingController();
  TextEditingController textFieldKayit2 = TextEditingController();

   // final UserManager c = Get.put(UserManager());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş")
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
            
              
            ),
          ),Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: const InputDecoration(
                    hintText:
                        "yas", 
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w300, color: Colors.red),
                    border:
                        OutlineInputBorder() 
                    ),
                controller: textFieldKayit2,
              
                onEditingComplete: () async{
          
                 await UserManager().isimAl(textFieldKayit.text, textFieldKayit2.text);
          Navigator.of(context).push(
                  MaterialPageRoute(
            builder: (context) => const KategoriSayfasi(),
                  ),
                );
           
                },
              ),
          ),
          const SizedBox(height: 20,),

         
        ],
      ),
    );
  }
}
