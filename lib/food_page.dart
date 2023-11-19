// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodez/cart_page.dart';
import 'package:foodez/food_details_populator.dart';
import 'cart_food_list.dart';

class food extends StatelessWidget {
  food_details food_det;
  cart_populator cart_pop = const cart_populator();
  food(this.food_det, {super.key});

  @override
  Widget build(BuildContext context) {
    addToCart(food_details food) {
      add_to_cart_foods(food, 1);
    }

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const cart()));
          },
          backgroundColor: const Color.fromRGBO(248, 74, 12, 1),
          child: const Icon(Icons.shopping_cart),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(8),
          color: Colors.white30,
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 20, left: 30),
                height: 60,
                color: Colors.grey[50],
                child: Row(children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ])),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(57, 57, 57, 0.2),
                        offset: Offset(0, 10),
                        blurRadius: 60)
                  ],
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                height: 600,
                child: Column(children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('images/Image${food_det.image_num}.png'),
                    backgroundColor: Colors.white,
                    radius: 100,
                  ),
                  const SizedBox(height: 20),
                  Text(food_det.name,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 38,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Text('Rs ${food_det.price}',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.red)),
                  const SizedBox(height: 10),
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text("Description",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black))),
                  const SizedBox(height: 5),
                  Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      child: Text(food_det.details,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54))),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text("Ingredients",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black))),
                  const SizedBox(height: 5),
                  Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topLeft,
                      child: Text(food_det.ingredients,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54)))
                ])),
            InkWell(
                onTap: () {
                  addToCart(food_det);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 72,
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: const Color.fromRGBO(248, 74, 12, 1)),
                  alignment: Alignment.center,
                  child: const Text("Add to cart",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ))
          ]),
        )),
      ),
    );
  }
}
