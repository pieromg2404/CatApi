import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/CatBreed.dart';

class HomeDetailScreen extends StatefulWidget {
  CatBreed catBreed;
  HomeDetailScreen({required this.catBreed});

  @override
  State<HomeDetailScreen> createState() => _HomeDetailScreenState();
}

class _HomeDetailScreenState extends State<HomeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.catBreed.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              widget.catBreed.imageUrl,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.catBreed.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),Container(height: 8,),
                Text(
                  "Country: ${widget.catBreed.origin}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Container(height: 8,),
                Text(
                  "Alt Name: ${widget.catBreed.alt_names}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),Container(height: 8,),
                Text(
                  "Inteligence: ${widget.catBreed.intelligence}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),Container(height: 8,),
                Text(
                  "Time of Life: ${widget.catBreed.life_span} years",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
