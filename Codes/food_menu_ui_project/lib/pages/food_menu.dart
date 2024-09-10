import 'package:flutter/material.dart';
import '../const/food_pics.dart';

class FoodMainMenu extends StatelessWidget {
  const FoodMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 35.0),
            child: Icon(
              Icons.menu_book_rounded,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 1,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Fast Food Place",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hamburger",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "   250 ₺",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 25),
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 200,
                      width: 210,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          FoodPics.burger,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                        mini: true,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.deepOrangeAccent,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tost",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "   130 ₺",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 25),
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 200,
                      width: 210,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          FoodPics.tost,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                        mini: true,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.deepOrangeAccent,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Makarna",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "   150 ₺",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 25),
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 200,
                      width: 210,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          FoodPics.makarna,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                        mini: true,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.deepOrangeAccent,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pizza",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "   250 ₺",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 25),
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 200,
                      width: 210,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          FoodPics.pizza,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 150,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
                        mini: true,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.deepOrangeAccent,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
