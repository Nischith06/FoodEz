// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'food_details_populator.dart';

final List<cart_food_details> cart_foods = [];

void add_to_cart_foods(food_details food, int quantity) {
  cart_foods.add(cart_food_details(
      food_name: food.name,
      price: food.price,
      quantity: quantity,
      total_price: food.price * quantity,
      image_num: food.image_num));
}

class cart_populator extends StatefulWidget {
  const cart_populator({super.key});

  @override
  _cart_populatorState createState() => _cart_populatorState();
}

class _cart_populatorState extends State<cart_populator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.68,
        child: ListView(
            children: cart_foods.map((food) {
          return cart_element(food);
        }).toList()));
  }
}

class cart_element extends StatefulWidget {
  cart_food_details food;
  cart_element(this.food, {super.key});

  @override
  State<cart_element> createState() => _cart_elementState();
}

class _cart_elementState extends State<cart_element> {
  void _incrementCounter() {
    if (widget.food.quantity == 0) {
      setState(() {
        widget.food.quantity++;
      });
      cart_foods.add(widget.food);
    } else {
      setState(() {
        widget.food.quantity++;
      });
    }
  }

  void _decrementCounter() {
    setState(() {
      if (widget.food.quantity > 0) {
        widget.food.quantity--;
        if (widget.food.quantity < 1) {
          cart_foods.remove(widget.food);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int num = widget.food.image_num;

    double containerHeight = widget.food.food_name.length > 20 ? 250 : 120;
    return Container(
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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: containerHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/Image$num.png'),
              backgroundColor: Colors.white,
              radius: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.food.food_name,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      Text('Rs ${(widget.food.price * widget.food.quantity)}',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.red))
                    ]),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                padding: const EdgeInsets.all(4),
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(248, 74, 12, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: _decrementCounter,
                        child: const Icon(
                          Icons.horizontal_rule_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Text(widget.food.quantity.toString(),
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              color: Colors.white)),
                      InkWell(
                        onTap: _incrementCounter,
                        child: const Icon(Icons.add_sharp, color: Colors.white),
                      )
                    ]),
              )
            ])
          ],
        ));
  }
}
