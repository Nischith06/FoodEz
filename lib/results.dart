// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'food_page.dart';
import 'food_details_populator.dart';
import 'cart_page.dart';
import 'main.dart';

class food_results extends StatelessWidget {
  String food_type;
  String cafe;
  food_results({super.key, this.food_type = '', this.cafe = ''});

  List<food_details> get_foods(String fT, {String c = ''}) {
    List<food_details> temp = [];

    if (fT == 'veg' || fT == 'non veg' || fT == 'juice') {
      for (int i = 0; i < foods.length; i++) {
        if (foods[i].type == fT) {
          temp.add(foods[i]);
        }
      }
    } else if (cafe != '') {
      for (int i = 0; i < foods.length; i++) {
        if (foods[i].canteen == c) {
          temp.add(foods[i]);
        }
      }
    } else {
      final regex = RegExp(fT, caseSensitive: false);
      for (int i = 0; i < foods.length; i++) {
        if (regex.hasMatch(foods[i].name)) {
          temp.add(foods[i]);
        }
      }
    }

    return temp;
  }

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  height: 60,
                  color: Colors.grey[50],
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  children: get_foods(food_type, c: cafe)
                      .map((e) => CardsFood(e))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardsFood extends StatelessWidget {
  final food_details food_det;
  CardsFood(this.food_det, {super.key});
  @override
  Widget build(BuildContext context) {
    int imageNum = food_det.image_num;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => food(food_det)),
          );
        },
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, left: 15, right: 5),
            width: 155,
            height: 301,
            child: Container(
                alignment: Alignment.center,
                child: Stack(children: <Widget>[
                  Container(
                      width: 200,
                      height: 250,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(57, 57, 57, 0.2),
                              offset: Offset(0, 30),
                              blurRadius: 60)
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Container(
                    alignment: Alignment.center,
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.all(6),
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                              child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('images/Image$imageNum.png'),
                          ))),
                      Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Text(
                            food_det.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 19.5,
                                height: 1.5),
                          )),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('Rs ${food_det.price}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(250, 74, 12, 1),
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                height: 1)),
                      )
                    ]),
                  ),
                ]))));
  }
}
