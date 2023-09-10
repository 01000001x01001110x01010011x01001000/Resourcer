import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resourcer/helper/custom_animation.dart';
import 'package:resourcer/helper/website_share.dart';
import 'package:resourcer/views/website_view.dart';

class WebSiteBox extends StatefulWidget {
  WebSiteBox({required this.website, super.key});
  Map<String, dynamic> website;

  @override
  State<WebSiteBox> createState() => _WebSiteBoxState();
}

class _WebSiteBoxState extends CustomAnimation<WebSiteBox> {
  double containerHeight = 0;
  bool isIconVisble = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 180,
          height: 180,
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: const Color.fromRGBO(0, 94, 205, 1.0),
            child: InkWell(
              splashColor: const Color.fromARGB(255, 0, 119, 255),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WebsiteView(websiteData: widget.website),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: const Color.fromRGBO(0, 94, 205, 1.0),
                ),
                child: FittedBox(
                  child: Text(
                    widget.website['name'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(255, 163, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // if (widget.website['showInfo'])
        AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          width: 188,
          height: containerHeight,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: 102,
            height: 82,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(216, 250, 255, 1.0).withOpacity(0.9),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.website["desc"]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedOpacity(
                      opacity: isIconVisble ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: IconButton(
                        onPressed: () {
                          widget.website['isFavourate'] == true
                              ? widget.website['isFavourate'] = false
                              : widget.website['isFavourate'] = true;
                          setState(() {});
                        },
                        icon: widget.website['isFavourate'] == true
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AnimatedOpacity(
                      opacity: isIconVisble ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      child: IconButton(
                        onPressed: () async {
                          await WebSiteShare().shareWebsite(
                              widget.website['name'], widget.website['url']);
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            15,
            8,
            0,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              iconSize: 25,
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onPressed: () {
                widget.website['showInfo'] == true
                    ? {
                        widget.website['showInfo'] = false,
                        // animationController.reverse();
                        containerHeight = 0,
                        isIconVisble = false,
                      }
                    : {
                        widget.website['showInfo'] = true,
                        animateContainer(),
                        isIconVisble = true,
                        // animationController.forward();
                      };
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  void animateContainer() {
    setState(() {
      containerHeight += 140;
    });
  }
}
