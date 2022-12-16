import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_view_controller.dart';

class MainViewView extends GetView<MainViewController> {
  const MainViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.blue,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 35,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    width: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Container(
                    width: 40,
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Obx((() {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabController.value,
            children: controller.screens,
          );
        })),
        bottomNavigationBar: Obx(
          () => Stack(
            children: [
              Container(
                height: 60,
                // color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.pink,
                            Colors.blue,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Colors.pink,
                  //     Colors.blue,
                  //   ],
                  // ),
                ),
                height: 60,
                // width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          controller.screens.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.tabController.value.animateTo(index);
                              controller.tabController.refresh();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / controller.screens.length,
                              // margin: const EdgeInsets.symmetric(horizontal: 5),
                              // color: index == controller.tabController.value.index ? Colors.red : null,
                              child: Column(
                                mainAxisAlignment:
                                    index == controller.tabController.value.index ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 20,
                                    color: Colors.transparent,
                                  ),
                                  index == controller.tabController.value.index
                                      ? Padding(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            controller.listPageName[index],
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: controller.listIconPage[index],
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                      left: ((MediaQuery.of(context).size.width / controller.screens.length * (controller.tabController.value.index + 1)) / (2) -
                              (40 / 2)) +
                          (MediaQuery.of(context).size.width / controller.screens.length / 2 * controller.tabController.value.index),
                      // top: 7.5,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.pink,
                              ],
                            ),
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            )),
                        child: controller.listIconPage[controller.tabController.value.index],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
