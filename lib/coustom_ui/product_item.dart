import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductItemUi extends StatelessWidget {
  Color? bgColor;
  ProductItemUi({ this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? AppColoers.LightGreyColor,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterLogo(
                  size: 110,
                ),
                Text('Wireless Headphone', style: mTextStyle12(mFontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₹120.00' ,  style: mTextStyle12(mFontWeight: FontWeight.bold),),
                    Row(

                      children: List.generate(4, (index) {
                        if(index == 3){
                          return Container(
                            margin: EdgeInsets.only(left: 2),
                            width: 20,
                            height: 20,
                            child: Center(child: Text('+2', style: TextStyle(fontSize: 7),)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 0.5,
                                color: AppColoers.blackColor

                              )
                            ),
                          );
                        }else{
                        return  Container(
                          margin: EdgeInsets.only(left: 2),
                            width: 20,
                            height: 20,
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColoers.blackColor

                                )
                            ),
                          );
                        }

                      }),
                    ),
                  ],
                )

              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
             width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColoers.primaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(21),bottomLeft: Radius.circular(11)),
            ),
              child: Center(
                child: Icon(Icons.favorite_border,color: AppColoers.whiteColor,),
              ),
                    ),
          )],
      ) ,
    );
  }
}
