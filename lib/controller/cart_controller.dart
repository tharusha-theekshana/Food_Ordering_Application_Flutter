import 'package:get/get.dart';

class CartController extends GetxController {
  var itemCount = 0.obs;
  var amount = 0.00.obs;

  void incrementItemCount() {
    itemCount.value++;
  }

  void decrementItemCount() {
    if (itemCount.value > 0) {
      itemCount.value--;
    }
  }
}