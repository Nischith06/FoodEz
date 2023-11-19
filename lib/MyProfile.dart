// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'orders.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(8),
        color: Colors.white30,
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          Container(
              padding: const EdgeInsets.all(30),
              height: 100,
              color: Colors.grey[50],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(" My Profile",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ])),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Personal Details",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Text("Change",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.red))
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
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              height: 200,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Image3.png'),
                      backgroundColor: Colors.white,
                      radius: 70,
                    )
                  ]),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              color: Colors.black),
                        ),
                        Text("name@gmail.com",
                            style: TextStyle(
                                fontFamily: 'Poppins', color: Colors.black)),
                        Text("+0123456789",
                            style: TextStyle(
                                fontFamily: 'Poppins', color: Colors.black))
                      ])
                ],
              )),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20)),
            height: 5,
            margin: const EdgeInsets.only(left: 80, right: 80),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const orders()));
            },
            child: Container(
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
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                margin: const EdgeInsets.all(10),
                height: 80,
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Orders",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      Icon(Icons.arrow_forward_ios)
                    ])),
          ),
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
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              margin: const EdgeInsets.all(10),
              height: 80,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pending reviews",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Icon(Icons.arrow_forward_ios)
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
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              margin: const EdgeInsets.all(10),
              height: 80,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Help",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Icon(Icons.arrow_forward_ios)
                  ])),
          Container(
            height: 72,
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: const Color.fromRGBO(248, 74, 12, 1)),
            alignment: Alignment.center,
            child: const Text("Update",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
          )
        ]),
      )),
    ));
  }
}
