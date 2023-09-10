import 'package:flutter/material.dart';
import 'package:resourcer/data/website_data.dart';
import 'package:resourcer/views/saved_websites.dart';
import 'package:resourcer/widgets/website_with_categories.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedWebsites(),
                  ));
            },
            icon: const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color.fromRGBO(207, 252, 255, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: WebsiteCategories(
                heading: 'photos',
                websites: websites,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
