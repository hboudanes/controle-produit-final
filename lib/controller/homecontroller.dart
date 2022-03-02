import 'package:get/get.dart';

class HomeController extends GetxController {
  int i = 0;
  incr() {
    i++;
    update();
  }
}
