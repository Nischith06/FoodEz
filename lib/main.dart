// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'MyProfile.dart';
import 'food_page.dart';

import 'orders.dart';
import 'results.dart';
import 'food_details_populator.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

List<food_details> foods = [];

void request() async {
  var url = Uri.parse("http://172.20.10.2:8000/food");
  http.Response res = await http.get(url);
  var json = jsonDecode(res.body);
  for (int i = 0; i < json.length; i++) {
    foods.add(food_details(
        name: json["$i"]["Food_Name"],
        price: json["$i"]["Food_Price"],
        details: json["$i"]["Food_Description"],
        image_num: json["$i"]["Food_Number"],
        type: json["$i"]["Food_Type"],
        canteen: json["$i"]["Canteen_Name"],
        ingredients: json["$i"]["Ingredients"]));
  }
}

List<canteen_details> canteen = [
  canteen_details(name: "udupi", image_num: 5),
  canteen_details(name: "munch", image_num: 2),
  canteen_details(name: "tango", image_num: 3),
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _searchValue = '';

  List<food_details> _filterFoods() {
    if (_searchValue.isEmpty) {
      return foods;
    }

    final regex = RegExp(_searchValue, caseSensitive: false);

    return foods.where((food) => regex.hasMatch(food.name)).toList();
  }

  @override
  void initState() {
    super.initState();
    foods = [];
    request();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => orders()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(5),
          child: SafeArea(
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfile()),
                            );
                          },
                          child: Icon(Icons.menu, size: 35)),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cart()),
                          );
                        },
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(19),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Delicious \nfood for you',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    color: Color.fromRGBO(239, 238, 238, 1),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _searchValue = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search for food...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  food_results(food_type: _searchValue),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 30),
                          blurRadius: 60)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  margin:
                      EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      food_results(food_type: "")));
                        },
                        child: Text('Food',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                color: Colors.black87)),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        food_results(food_type: "veg")));
                          },
                          child: Text('Veg',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.black87))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        food_results(food_type: 'non veg')));
                          },
                          child: Text('Non Veg',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.black87))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        food_results(food_type: 'juice')));
                          },
                          child: Text('Juice',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  color: Colors.black87)))
                    ],
                  )),
              CardsFood_populator("veg"),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: Text('Favourite Cafeteria :',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.black)),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 100,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: canteen
                          .map((e) => Cafeteria(
                                image_val: e.image_num,
                                name: e.name,
                              ))
                          .toList())),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Dishes(2), Dishes(3), Dishes(14), Dishes(5)])),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: Text('Favourite Dishes :',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.black)),
              ),
              CardsFood_populator("veg"),
            ]),
          ),
        ));
  }
}

class Dishes extends StatelessWidget {
  int image_val = 14;
  Dishes(int a, {super.key}) {
    image_val = a;
  }
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white38,
        backgroundImage: AssetImage('images/Image$image_val.png'),
        radius: 40);
  }
}

class CardsFood_populator extends StatefulWidget {
  String food_type = "";
  CardsFood_populator(String food_type, {super.key}) {
    this.food_type = food_type;
  }
  @override
  State<CardsFood_populator> createState() => _CardsFood_populatorState();
}

class _CardsFood_populatorState extends State<CardsFood_populator> {
  List<food_details> temp_food = foods;
  List<food_details> get_food(String type) {
    food_details i;
    List<food_details> tFoods = [];
    for (i in foods) {
      if (i.type == type) {
        tFoods.add(i);
      }
    }
    if (tFoods.isEmpty) {
      return foods;
    } else {
      return tFoods;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: get_food(widget.food_type).map((food) {
              return CardsFood(food_det: food);
            }).toList()));
  }
}

class CardsFood extends StatelessWidget {
  food_details food_det;
  CardsFood({super.key, required this.food_det});
  @override
  Widget build(BuildContext context) {
    int imageVal = food_det.image_num;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => food(food_det)),
          );
        },
        child: Container(
            margin: EdgeInsets.only(top: 25, left: 15, right: 5),
            width: 200,
            height: 321,
            child: Stack(children: <Widget>[
              Container(
                  width: 200,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(57, 57, 57, 0.2),
                          offset: Offset(0, 30),
                          blurRadius: 60)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  )),
              Column(children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.only(top: 10, left: 20, right: 10),
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/Image$imageVal.png'),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      food_det.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 19.5,
                          height: 1.5),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 19),
                  padding: EdgeInsets.all(6.0),
                  child: Text('Rs ${food_det.price}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(250, 74, 12, 1),
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          height: 1)),
                )
              ]),
            ])));
  }
}

class Cafeteria extends StatelessWidget {
  String name;
  int image_val;
  Cafeteria({super.key, required this.name, required this.image_val});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => food_results(cafe: name)),
          );
        },
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(13),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromRGBO(232, 232, 232, 3),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/Image$image_val.png'),
              ),
              title: Text(
                name,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            )));
  }
}

class FavDishes extends StatelessWidget {
  int image_val = 14;
  FavDishes(int a, {super.key}) {
    image_val = a;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(239, 238, 238, 3),
        ),
        child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/Image$image_val.png'),
              ),
              title: Text(
                'Munch',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            )));
  }
}
