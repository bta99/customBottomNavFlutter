import 'package:get/get.dart';

class ChatController extends GetxController {
  //TODO: Implement ChatController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('chat');
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
