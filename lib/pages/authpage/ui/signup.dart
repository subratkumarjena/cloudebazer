
import 'package:cloudbazar/pages/authpage/ui/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signup'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: nameController ,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(),
                hintText: 'Enter Your Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: numberController ,
              decoration: InputDecoration(
                label: Text("Ph Number"),
                border: OutlineInputBorder(),
                hintText: '9124686506',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: emailController ,

              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
                hintText: 'your@ggmail.com',
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: passwordController,
              decoration:  InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Password',
              ),
            ),
          ),
          TextButton(
            child: Text('Do not have an account? Register'),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return LogIn();
              }));
            },
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: ElevatedButton(
              onPressed: () async {




              },
              child: Text('Signup'),
            ),
          ),

        ],
      ),
    );
  }
}