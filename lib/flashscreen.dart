import 'dart:async';


import 'package:cloudbazar/pages/authpage/ui/signIn.dart';
import 'package:cloudbazar/pages/mainhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'data/app_prif.dart';


class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    login();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 300,height: 300,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset('assets/image/cblogo.png',fit: BoxFit.fill,)),
            ),
          ],
        ),
      ),
    );
  }
  login() async {
    var login = await AppPrefs().getToken();

    Timer(Duration(seconds: 3), () {
      if (login != '') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainHome(),));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LogIn(),));
      }
    });
  }
}

