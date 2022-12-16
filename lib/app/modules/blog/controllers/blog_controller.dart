import 'package:get/get.dart';

class BlogController extends GetxController {
  //TODO: Implement BlogController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('blog');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
