import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/change_password/login_change_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/login_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/profile/info_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/profile/update_profile/update_profile_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/verification/login_code_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/Login/verification/login_send_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/dashboard/home_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/management/lists/details/detail_remember_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/management/lists/list_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/management/lists/update/remember_update_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/management/note/create_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/management/record/record_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/register/register_page.dart';
import 'package:pm2_pf_grupo_4/src/pages/register/verification/register_code_page.dart';

void main() async {
  await GetStorage.init();
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
        //GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/register/codes', page: () => RegisterCodePage()),
        GetPage(name: '/login/recover', page: () => LoginSendPage()),
        GetPage(name: '/login/codes', page: () => LoginCodePage()),
        GetPage(name: '/login/changePassword', page: () => LoginChangePassword()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/create', page: () => CreatePage()),
        GetPage(name: '/remember/list', page: () => RemembersListPage()),
        GetPage(name: '/remember/list/detail', page: () => RememberDetailPage()),
        GetPage(name: '/remember/list/detail/update', page: () => RememberUpdatePage()),
        GetPage(name: '/record', page: () => RecordPage()),
        GetPage(name: '/login/profile/info', page: () => InfoPage()),
        GetPage(name: '/login/profile/info/update', page: () => UserProfileUpdatePage())
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