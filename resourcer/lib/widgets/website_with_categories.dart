import 'package:flutter/material.dart';

class WebsiteCategories extends StatefulWidget {
  const WebsiteCategories({
    required this.heading,
    required this.websites,
    Key? key,
  }) : super(key: key);
  final String heading;
  final List<Map<String, dynamic>> websites;

  @override
  State<WebsiteCategories> createState() => _WebsiteCategoriesState();
}

class _WebsiteCategoriesState extends State<WebsiteCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: "websites for",
                children: [TextSpan(text: " ${widget.heading} ")],
              ),
            ),
            Image.asset('assets/south_east.png'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          itemCount: widget.websites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              width: 102,
              height: 102,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(0, 94, 205, 1.0),
              ),
            );
          },
        ),
      ],
    );
  }
}
