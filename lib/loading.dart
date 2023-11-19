// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// import 'cart.dart';
// import 'MyProfile.dart';
// import 'food.dart';

// import 'orders.dart';
// import 'results.dart';
// import 'food_details_populator.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// List<food_details> foods = [];

// void request() async {
//   var url = Uri.parse("http://192.168.22.1:8000/food");
//   http.Response res = await http.get(url);
//   var json = jsonDecode(res.body);
//   for (int i = 0; i < json.length; i++) {
//     foods.add(food_details(
//         name: json["$i"]["Food_Name"],
//         price: json["$i"]["Food_Price"],
//         details: json["$i"]["Food_Description"],
//         image_num: 2,
//         type: json["$i"]["Food_Type"],
//         canteen: json["$i"]["Canteen_Name"]));
//   }
// }

// List<canteen_details> canteen = [
//   canteen_details(name: "Udupi", image_num: 5),
//   canteen_details(name: "Munch", image_num: 2),
//   canteen_details(name: "Tango", image_num: 3),
// ];


// void initState() {
//     foods = [];
//     super.initState();
//     request();
//   }

// class 