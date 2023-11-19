// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodez/payment_status.dart';

class payment extends StatefulWidget {
  double total_price;
  payment({super.key, required this.total_price});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  String payment_method = '';
  void proceed() {
    if (payment_method == '') {
      () {};
    } else if (widget.total_price == 0.0) {
      Navigator.pop(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Payment_status()),
      );
    }
  }

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
                        widget.total_price = 0.0;
                        Navigator.pop(context);
                      },
                    ),
                    const Text(" Checkout",
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
                    Text("Payment",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    Text("      ",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          value: "Card",
                          onChanged: (value) {
                            setState(() {
                              payment_method = value.toString();
                            });
                          },
                          groupValue: payment_method,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange[800]),
                            child: const Icon(Icons.credit_card)),
                        const Text('  Card',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 20))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          value: "Bank",
                          onChanged: (value) {
                            setState(() {
                              payment_method = value.toString();
                            });
                          },
                          groupValue: payment_method,
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink),
                            child: const Icon(Icons.account_balance)),
                        const Text('  Bank',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 20))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          value: "Google Pay",
                          onChanged: (value) {
                            setState(() {
                              payment_method = value.toString();
                            });
                          },
                          groupValue: payment_method,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: const Text(
                            " G ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text('  Google Pay',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 20))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
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
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text('Total : Rs ${widget.total_price}',
                style: const TextStyle(
                    fontFamily: 'Poppins', color: Colors.black, fontSize: 20)),
          ),
          InkWell(
            onTap: () {
              proceed();
            },
            child: Container(
              height: 72,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: const Color.fromRGBO(248, 74, 12, 1)),
              alignment: Alignment.center,
              child: const Text("Proceed",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
          )
        ]),
      )),
    ));
  }
}
