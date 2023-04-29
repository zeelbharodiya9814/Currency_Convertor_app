
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pr_currency_app/theme.dart';
import 'package:pr_currency_app/views/screens/homepage.dart';
import 'package:pr_currency_app/views/screens/search_currency.dart';
import 'package:pr_currency_app/views/screens/splashscreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      // theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
      ),
      darkTheme: ThemeData.dark(
      ),
      getPages: [
        GetPage(name: "/", page: () => const SplashPage(),),
        GetPage(name: "/HomePage", page: () => const HomePage(),),
        GetPage(name: "/Search", page: () => const Search(),),
      ],
    ),
  );
}






// Expanded(
// child: Container(
// padding: const EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 30),
// child:Container(
// // height: 100,
// // width: 200,
// alignment:Alignment.center,
// decoration:BoxDecoration(
// borderRadius: BorderRadius.circular(20.0),
// color: Colors.grey[900],
// shape: BoxShape.rectangle,
// boxShadow: [
// BoxShadow(
// color: Colors.grey.shade700,
// spreadRadius: 0.0,
// blurRadius:10,
// offset: Offset(3.0, 3.0)),
// BoxShadow(
// color: Colors.grey.shade800,
// spreadRadius: 0.0,
// blurRadius: 10 / 2.0,
// offset: Offset(3.0, 3.0)),
// BoxShadow(
// color: Colors.black,
// spreadRadius: 2.0,
// blurRadius: 10,
// offset: Offset(-3.0, -3.0)),
// BoxShadow(
// color: Colors.black,
// spreadRadius: 2.0,
// blurRadius: 10 / 2,
// offset: Offset(-3.0, -3.0)),
// ],
// ),
// child: TextField(
// showCursor: true,
// readOnly: true,
// controller: textEditingController,
// keyboardType: TextInputType.number,
// style: TextStyle(fontSize: 18),
// decoration: InputDecoration(
// contentPadding: const EdgeInsets.all(20),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: BorderSide.none,
// ),
// ),
// ),
// ),
// ),
// ),