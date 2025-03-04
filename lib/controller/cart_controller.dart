import 'package:get/get.dart';

class CartController extends GetxController {
  var itemCount = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  // Increment order item count
  void incrementItemCount() {
    itemCount.value++;
  }

  // Decrement order item count
  void decrementItemCount() {
    if (itemCount.value > 0) {
      itemCount.value--;
    }
  }

  // Set last amount
  void setAmount(String price) {
    totalAmount.value = double.parse(price);
  }


}