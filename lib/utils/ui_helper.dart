import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget heightSpacing({double mHeight = 11}){
  return SizedBox(
    height:mHeight ,
  );
}
Widget widthSpacing({double mWidth = 11}){
  return SizedBox(
    width:mWidth ,
  );
}

TextStyle mTextStyle34({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}){
  return TextStyle(
    fontFamily: 'RobotoFont',
    fontSize: 34,
    fontWeight: mFontWeight,
    color: mColor
  );
}

TextStyle mTextStyle24({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}){
  return TextStyle(
      fontFamily: 'RobotoFont',
      fontSize: 24,
      fontWeight: mFontWeight,
      color: mColor
  );
}
TextStyle mTextStyle43({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}){
  return TextStyle(
      fontFamily: 'RobotoFont',
      fontSize: 43,
      fontWeight: mFontWeight,
      color: mColor
  );
}
TextStyle mTextStyle25({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}){
  return TextStyle(
      fontFamily: 'RobotoFont',
      fontSize: 25,
      fontWeight: mFontWeight,
      color: mColor
  );
}
TextStyle mTextStyle16({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}){
  return TextStyle(
      fontFamily: 'RobotoFont',
      fontSize: 16,
      fontWeight: mFontWeight,
      color: mColor
  );
}
TextStyle mTextStyle12({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}){
  return TextStyle(
      fontFamily: 'RobotoFont',
      fontSize: 12,
      fontWeight: mFontWeight,
      color: mColor
  );
}
TextStyle mTextStyle18({FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black,}){
  return TextStyle(
      fontFamily: 'RobotoFont',
      fontSize: 18,
      fontWeight: mFontWeight,
      color: mColor
  );
}
myTextFiled({required TextEditingController controllerName,required String label, String? hint,keyboardType=TextInputType.text,
  String? suffixText,Icon? suffixIcon,String? prefixText,bool obscureText=false}){
  return Container(
    height: 65,
    width: 500,
    child: TextField(
      controller: controllerName,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixText: prefixText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

myAppBar(String text){
  return AppBar
    (title: Text(text),
    centerTitle: true,backgroundColor: Colors.blueGrey,);
}
myPassController({required TextEditingController controllerName,required String label, String? hint,bool value=true}){
  return TextField(
    controller: controllerName,
    obscureText: value,
    decoration: InputDecoration(
        label: Text(label),hintText: hint,
        suffixIcon: InkWell(
            onTap: (){
              value==true?
              value=false:value=true;
            },
            child: Icon(Icons.remove_red_eye)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
        )
    ),
  );
}
myWidget(VoidCallback onTap,Widget widget,){
  return InkWell(
      onTap: onTap,
      child: widget
  );
}
myText22(String text){
  return Text(text,style: TextStyle(fontSize: 22),);
}
myText(String text){
  return Text(text,style: TextStyle(fontWeight: FontWeight.bold),);
}