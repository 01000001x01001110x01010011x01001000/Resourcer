import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resourcer/helper/website_box.dart';
import 'package:resourcer/views/website_view.dart';
import 'package:resourcer/helper/website_share.dart';

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
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            RichText(
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              text: TextSpan(
                text: "   websites for",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
                children: [
                  TextSpan(
                    text: " ${widget.heading}",
                    style: const TextStyle(
                      color: Color.fromRGBO(0, 94, 205, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/south_east.png',
              scale: 0.7,
              filterQuality: FilterQuality.high,
              color: const Color.fromRGBO(0, 94, 205, 1.0),
              isAntiAlias: true,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: widget.websites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              Map<String, dynamic> website = widget.websites[index];

              return WebSiteBox(website: website);
            },
          ),
        ),
      ],
    );
  }
}
