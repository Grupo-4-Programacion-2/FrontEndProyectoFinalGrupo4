import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

//import '../../models/user.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // User user = User.fromJson(GetStorage().read('user') ?? {});

  void goToRegisterPage() {
    Get.toNamed("/register");
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) { //This validation is for login
      if (kDebugMode) {
        print("Email $email");
        print("Password $password");
      }
    }

  }

  bool isValidForm(String email, String password) {

    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el Email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes Ingresar el Password');
      return false;
    }

    return true;
  }

}
