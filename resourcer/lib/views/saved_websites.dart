import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resourcer/data/website_data.dart';
import 'package:resourcer/helper/website_box.dart';
import 'package:resourcer/helper/website_share.dart';
import 'package:resourcer/views/website_view.dart';

class SavedWebsites extends StatefulWidget {
  const SavedWebsites({super.key});

  @override
  State<SavedWebsites> createState() => _SavedWebsitesState();
}

class _SavedWebsitesState extends State<SavedWebsites> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favourateWebsites = [];
    for (var i in websites) {
      if (i['isFavourate'] == true) {
        favourateWebsites.add(i);
      }
    }
    // favourateWebsites.add(websites.map((e) {
    //   if (e['isFavourate'] == true) {
    //     return e;
    //   }
    // }) as Map<String, dynamic>);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Color.fromRGBO(0, 94, 205, 1.0),
            shadows: [
              Shadow(
                blurRadius: 0.5,
                color: Colors.black,
                offset: Offset(
                  0.3,
                  0.3,
                ),
              ),
            ]),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(216, 250, 255, 1.0),
        elevation: 0,
        title: RichText(
            text: const TextSpan(
          text: 'Welcome To ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: 'Resourcer',
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(0, 94, 205, 1.0),
              ),
            )
          ],
        )),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: favourateWebsites.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return WebSiteBox(website: favourateWebsites[index]);
        },
      ),
    );
  }
}
