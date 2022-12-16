import 'package:flutter/material.dart';

class StoriesItem extends StatelessWidget {
  const StoriesItem({
    Key? key,
    this.image,
    this.title,
    this.status = false,
    this.showAdd = false,
  }) : super(key: key);

  final String? image;
  final String? title;
  final bool? status;
  final bool? showAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(bottom: 5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: status!
                      ? const LinearGradient(
                          colors: [
                            Colors.pink,
                            Colors.blue,
                          ],
                        )
                      : null,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    image ?? 'assets/images/avatar_null.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              showAdd!
                  ? Positioned(
                      right: 0,
                      bottom: 5,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.pink,
                              Colors.blue,
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
