import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/login.dart';
import 'package:pm2_pf_grupo_4/src/pages/register/register_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages:  [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage())
      ],
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: const ColorScheme(
              primary: Colors.lightGreen,
              secondary: Colors.amberAccent,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey
          )
      ),
    );
  }

}