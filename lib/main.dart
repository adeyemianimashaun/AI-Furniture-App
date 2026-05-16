import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture/authentification/wrapper.dart';
import 'package:furniture/provider/cartprovider.dart';
import 'package:furniture/provider/favoriteprovider.dart';
//import 'package:furniture/upload_products.dart';
import 'package:provider/provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await uploadAllProducts();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>Cartprovider()),
      ChangeNotifierProvider(create: (context)=>Favprovider()),
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,

      home: Wrapper(),
    );
  }
}

