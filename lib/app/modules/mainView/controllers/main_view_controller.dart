import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myappv1/app/modules/blog/views/blog_view.dart';
import 'package:myappv1/app/modules/chat/views/chat_view.dart';
import 'package:myappv1/app/modules/home/views/home_view.dart';
import 'package:myappv1/app/modules/setting/views/setting_view.dart';

class MainViewController extends GetxController with GetSingleTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this).obs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.value.dispose();
    super.onClose();
  }

  RxList<Widget> screens = <Widget>[
    const HomeView(),
    const SettingView(),
    const BlogView(),
    const ChatView(),
  ].obs;

  RxList<String> listPageName = <String>[
    'trang chủ',
    'cài đặt',
    'bài viết',
    'nhắn tin',
  ].obs;

  RxList<Widget> listIconPage = <Widget>[
    const Icon(
      Icons.home_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.settings_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.podcasts_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.chat_outlined,
      color: Colors.white,
    ),
  ].obs;

  late Rx<TabController> tabController;
}
