import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
  }
}