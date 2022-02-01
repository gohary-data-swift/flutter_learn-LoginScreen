import 'dart:ffi';

import 'package:flutter/material.dart';

const image = 'https://d3cif2hu95s88v.cloudfront.net/blog/wp-content/uploads/2020/05/14134924/Tulip-MyFlowerTree-1024x768.jpg';

class HomeVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.menu),
        title: Text("New App"),
        actions: [
          IconButton(onPressed: onPresedMenu, icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(

                  image: NetworkImage(
                      image),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  width: double.infinity,
                  color: Colors.black.withOpacity(.6),
                  alignment: Alignment.center,
                  child: Text('Flower',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPresedMenu() {
    print("Hello search");
  }
}
