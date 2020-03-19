

import 'package:cached_network_image/cached_network_image.dart';


import 'package:flutter/material.dart';
import 'package:nobroket/model/items.dart';
import 'package:nobroket/model/user.dart';
import 'package:nobroket/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


TextStyle priceTextStyle =
    TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold);

class HomeItems extends StatelessWidget {
  User user ;
  

  List<Item> item_list;
  Item item;
  HomeItems(this.user);
 
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              "Categories",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.only(top: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return _categoryList(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              "Featured Products",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.only(top: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return _featuredProduct(context , index);
              },
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade300,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Recent products",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      print("hello");
                    },
                    child: Text("View all"),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 4.0),
          // ...[1, 2, 3, 4, 5].map(
          //   (product) => ProductListItem( this.user,
          //     onPressed: () {}, 
          //   ),
          // ),
          const SizedBox(height: 10.0),
        ],
      );
  }

  Widget _featuredProduct(BuildContext context , int index) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
        SafeArea(
          child:   Container(
            child: SafeArea(
         child: Image.memory(user.image),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 200,
          ),
        ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              color: Colors.black87,
              child: Text(
                "Sofa Set $index",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _categoryList(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
        SafeArea(
          child:   Container(
            child: SafeArea(
         child: Image.memory(user.image),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 200,
          ),
        ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              color: Colors.black87,
              child: Text(
                "Sofa Set",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Function onPressed;
  User user;
 ProductListItem(this.user, this.onPressed,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        elevation: 0.5,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
           Container(
            child: Image.memory(user.image),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("Drawer Table"),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Rs. 8000", style: priceTextStyle)
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          print('tapped');
                        },
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}