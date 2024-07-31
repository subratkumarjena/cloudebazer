import 'package:cloudbazar/data/model/ordermodel.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/material.dart';

import '../utils/app_coloers.dart';

class OrderItem extends StatelessWidget{
  List<ProductData> mData;
  int index;
  OrderItem({required this.mData, required this.index});
  @override
  Widget build(BuildContext context) {
    var data = mData[index];
    return Container(
     child:  Row(
      children: [
        Container(
          width: 100,
          height: 120,
          color: AppColoers.LightGreyColor,
            child: Image.network('${data.image}',height: 90.0,width: 90.0,)),
        widthSpacing(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpacing(),
            Text('${data.name}',style: mTextStyle16(),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${data.quantity}',style: mTextStyle12(),),
            ),
            heightSpacing(),
            Text('₹${data.price}',style: mTextStyle16(),),
            heightSpacing(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return Icon(Icons.star_border_outlined,size:30.0,color: AppColoers.greyColor,);
        }),
      ),

            Text('Rate the product now',style: mTextStyle12(),),
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios_outlined, size: 15, color: AppColoers.primaryColor),
      ],
      ),
    );
  }}