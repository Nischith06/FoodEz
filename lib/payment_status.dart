// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:foodez/cart_page.dart';
import 'package:foodez/orders.dart';

const paymentsuccessful = "no";

class Payment_status extends StatefulWidget {
  const Payment_status({super.key});

  @override
  State<Payment_status> createState() => _Payment_statusState();
}

class _Payment_statusState extends State<Payment_status> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white30,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.white30,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: page_title(
                      title: "Payment Status",
                    ),
                  ),
                ),
                PaymentStatus_populator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentStatus_populator extends StatelessWidget {
  const PaymentStatus_populator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 600,
      padding: EdgeInsets.all(10),
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              if (paymentsuccessful == "yes") ...[
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Payment Successful!",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/payment_success.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "The canteen has recieved your order.\n\nPlease check the 'orders' page for the QR code of this order.",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => orders()));
                      },
                      child: Container(
                        height: 56,
                        margin: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color.fromRGBO(248, 74, 12, 1)),
                        alignment: Alignment.center,
                        child: Text("Go to orders page",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ] else ...[
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Payment Failed!",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/payment_failed.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Any amount deducted will be refunded back soon.\n\nYou can place your order again.",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
