import 'package:flutter/material.dart';

class StatusBarPostItem extends StatelessWidget {
  const StatusBarPostItem({
    Key? key,
    this.avatar,
    this.name,
    this.action,
  }) : super(key: key);

  final String? avatar;
  final String? name;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(avatar ?? ''),
              ),
            ),
            Text(
              name ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.more_vert_outlined,
            size: 17,
          ),
        ),
      ],
    );
  }
}
