import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/status_bar_post_item.dart';
import '../../../widgets/stories_item.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AutomaticKeepAliveClientMixin {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //stories
          SizedBox(
            width: Get.width,
            height: 100,
            // color: Colors.green,
            child: Row(
              children: [
                const StoriesItem(
                  showAdd: true,
                  title: 'Tin của bạn',
                ),
                SizedBox(
                  width: Get.width - 84,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                      (index) => const StoriesItem(
                        status: true,
                        title: 'Tuấn Anh',
                        image: 'assets/images/stories.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //post
          ...List.generate(
            5,
            (index) => PostWidget(),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  PostWidget({
    Key? key,
  }) : super(key: key);

  bool? like = false;

  @override
  Widget build(BuildContext context) {
    late StateSetter setStatee;
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatusBarPostItem(
            avatar: 'assets/images/avatar.png',
            name: 'Tuấn Anh',
          ),
          InkWell(
            onDoubleTap: () {
              setStatee(() => like = !like!);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: Get.width,
              height: 300,
              color: Colors.black,
              child: Image.asset('assets/images/post_image.png'),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              StatefulBuilder(builder: ((context, setState) {
                setStatee = setState;
                return like!
                    ? InkWell(
                        onTap: () {
                          setState(() => like = false);
                        },
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: Colors.pink,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() => like = true);
                        },
                        child: const Icon(Icons.favorite_border_rounded));
              })),
              const SizedBox(width: 10),
              const Icon(Icons.message_outlined),
              const SizedBox(width: 10),
              const Text(
                'có 1.456 người thích',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.pink),
                    ),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(50),
                    //   child: Image.network(''),
                    // ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'write comment',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text('🤗'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text('❤️'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text('🙌'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
