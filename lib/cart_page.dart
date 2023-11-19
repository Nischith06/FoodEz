// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:foodez/payment.dart';

import 'package:flutter/material.dart';
import 'cart_food_list.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  double total_price = 0.0;
  void calculate_total() {
    setState(() {
      total_price = 0.0;
    });
    for (var element in cart_foods) {
      total_price += element.price * element.quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.all(8),
          color: Colors.white30,
          child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: page_title(
                  title: "Cart",
                )),
            cart_populator(),
            InkWell(
                onTap: () {
                  calculate_total();
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => payment(
                              total_price: total_price,
                            )),
                  );
                },
                child: page_button()),
          ]),
        )),
      ),
    );
  }
}

class page_button extends StatelessWidget {
  const page_button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Color.fromRGBO(248, 74, 12, 1)),
      alignment: Alignment.center,
      child: Text("Complete order",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white)),
    );
  }
}

class page_title extends StatelessWidget {
  String title = " ";
  page_title({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        height: 100,
        color: Colors.grey[50],
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios),
              SizedBox(width: 10),
              Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)))
            ]));
  }
}
