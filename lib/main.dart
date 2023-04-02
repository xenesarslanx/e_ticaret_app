import 'package:e_ticaret_app/firebase_options.dart';
import 'package:e_ticaret_app/view/categoriesView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KategoriSayfasi(),
  ));
  
}

