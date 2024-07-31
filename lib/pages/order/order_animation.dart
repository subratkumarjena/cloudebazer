import 'dart:async';
import 'package:cloudbazar/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../mainhome.dart';

class OrderAnim extends StatefulWidget{
  @override
  State<OrderAnim> createState() => _OrderAnimState();
}

class _OrderAnimState extends State<OrderAnim> {
        @override
  void initState() {
    super.initState();
    autonav();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: double.infinity,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Lottie.asset('assets/lottie/order_placed_anim.json'),
                  height: 260,
                  width: 250,
                ),
                Text('Order Placed')
              ],
            ),

        ),
      ),
    );
  }
        autonav()  {
          Timer(Duration(seconds: 5), () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHome(),));
          });
        }
}