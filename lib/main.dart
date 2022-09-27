import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:store_management_flutter/pages/acount/user_profile_page.dart';
import 'package:store_management_flutter/pages/customer/add_customer_mobile.dart';
import 'package:store_management_flutter/pages/customer/customer_page.dart';
import 'package:store_management_flutter/pages/dashboard_page.dart';
import 'package:store_management_flutter/pages/product/add_product_mobile.dart';
import 'package:store_management_flutter/pages/product/product_page.dart';
import 'package:store_management_flutter/pages/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:store_management_flutter/pages/staff/add_staff_mobile.dart';
import 'package:store_management_flutter/pages/staff/staff_page.dart';

void main() {
  runApp(const MyApp());
  if(Platform.isWindows || Platform.isMacOS || Platform.isLinux){
    doWhenWindowReady(() {
      var initialSize = const Size(1260, 680);
      appWindow.size = initialSize;
      appWindow.minSize = initialSize;
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CustomerPage(),
    );
  }
}