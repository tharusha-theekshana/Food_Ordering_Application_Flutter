import 'package:get/get.dart';

class CartController extends GetxController {
  var itemCount = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  void incrementItemCount() {
    itemCount.value++;
  }

  void decrementItemCount() {
    if (itemCount.value > 0) {
      itemCount.value--;
    }
  }

  void setAmount(String price) {
    totalAmount.value = double.parse(price);
  }


}