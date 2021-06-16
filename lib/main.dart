import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_route_test/src/home.dart';
import 'package:getx_route_test/src/pages/binding.dart';
import 'package:getx_route_test/src/pages/binding/binding_page.dart';
import 'package:getx_route_test/src/pages/named/first.dart';
import 'package:getx_route_test/src/pages/named/second.dart';
import 'package:getx_route_test/src/pages/next.dart';
import 'package:getx_route_test/src/pages/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // routes: {
      //   '/': (context) => Home(),
      //   '/first': (context) => FirstNamedPage(),
      //   '/second': (context) => SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: '/', page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: '/first',
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/second',
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/next', page: () => NextPage(), transition: Transition.zoom),
        GetPage(
            name: '/user/:uid',
            page: () => UserPage(),
            transition: Transition.zoom),
        GetPage(
          name: '/binding',
          page: () => BindingPage(),
          binding: BindingPageBinding(),
        ),
      ],
    );
  }
}
