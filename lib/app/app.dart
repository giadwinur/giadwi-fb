import 'package:flutter/material.dart';
import 'package:latihan/ui_screens/users/total.dart';
// import 'package:latihan/ui_screens/coba.dart';
import 'package:latihan/ui_screens/users/widgets/coba.dart';
import 'package:latihan/ui_screens/users/shop.dart';
import 'package:latihan/ui_screens/home.dart';
// import 'package:latihan/ui_screens/users/widgets/icon_bawah.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      // routes: {
      //   "/": (context) => const Coba(),
      //   // "shopPage" (context) => const ShopX(),
      // },
      home: const Home(),
      // home: const TotalX(),
      // home: const Coba(),
      // home: const AdminView(),
    );
  }
}
