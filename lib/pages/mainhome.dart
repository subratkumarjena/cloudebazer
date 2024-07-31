import 'package:cloudbazar/pages/profile/user_profile.dart';
import 'package:cloudbazar/pages/wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_coloers.dart';
import 'cart/cart_page.dart';
import 'home_page.dart';

class MainHome extends StatefulWidget{
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  List<Widget> navpage = [
    HomePage(),
    WishList(),
    CartPage(),
    UserProfile(),
  ];
  int selecedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     extendBody: true,
     body: navpage[selecedIndex],

     bottomNavigationBar: BottomAppBar(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           IconButton(onPressed: (){
             setState(() {
               selecedIndex=0;
             });
           }, icon: Icon(Icons.menu_outlined,size: 30,color: Colors.grey,),),
           IconButton(onPressed: (){
             setState(() {
               selecedIndex=1;
             });
           }, icon: Icon(Icons.favorite_outline_outlined,size: 30,color: Colors.grey),),
           IconButton(onPressed: (){
             setState(() {
               selecedIndex=2;
             });
           }, icon: Icon(Icons.shopping_cart_outlined,size: 30,color: Colors.grey,),),
           IconButton(onPressed: (){
             setState(() {
               selecedIndex=3;
             });
           }, icon: Icon(Icons.account_circle_outlined,size: 30,color: Colors.grey,),),
         ],),

       elevation: 11,
       shadowColor: AppColoers.primaryColor,
       surfaceTintColor: Colors.white,
       notchMargin: 6,
       shape: CircularNotchedRectangle(),

     ),

     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     floatingActionButton: FloatingActionButton(
       backgroundColor: AppColoers.primaryColor,
       foregroundColor: AppColoers.whiteColor,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(100)
       ),
       onPressed: (){
         Navigator.pushReplacement(
             context,
             MaterialPageRoute(
               builder: (context) => CartPage(),
             ));
       },
       child: Icon(Icons.home_outlined),
     ),
   );
  }
}