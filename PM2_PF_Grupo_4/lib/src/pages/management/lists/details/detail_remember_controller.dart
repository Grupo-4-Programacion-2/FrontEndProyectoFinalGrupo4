import 'package:get/get.dart';
import 'package:pm2_pf_grupo_4/src/models/remembers.dart';
import 'package:pm2_pf_grupo_4/src/providers/remember_provider.dart';

import '../../../../models/user.dart';
import '../../../../providers/user_provider.dart';
import 'detail_remember_page.dart';

class RememberDetailController extends GetxController {
  Remembers remembers = Remembers.fromJson(Get.arguments['remembers']);

  //RememberDetailPage rememberDetailPage = RememberDetailPage();
  var total = 0.0.obs;
  var idDelivery = ''.obs;
  var nota;

  UsersProvider usersProvider = UsersProvider();
  RememberProvider rememberProvider = RememberProvider();

  List<User> users = <User>[].obs;

  RememberDetailController() {
    print('Recordatorio: ${remembers.toJson()}');
  }

  // void goToOrderMap() {
  //   Get.toNamed('/client/orders/map', arguments: {
  //     'remembers': remembers.toJson()
  //   });
  // }

  void Delete() async {
    return await rememberProvider.deleteTask(remembers.id);
  }

  void ToHome() {
    Delete();
    Get.toNamed('/home');
  }

  void goToUpdateRemember(Remembers remembers) {
    nota = remembers.notaTexto ?? '';
    print(nota);
    Get.toNamed('/remember/list/detail/update', arguments: {
      'remembers': remembers.toJson()
    });
  }

  // void getTotal() {
  //   total.value = 0.0;
  //   remembers.forEach(() {
  //     total.value = total.value + (product.quantity! * product.price!);
  //   });
  // }
}
