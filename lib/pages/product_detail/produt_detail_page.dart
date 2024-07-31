

import 'package:cloudbazar/pages/home_page.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../mainhome.dart';
import 'product_detail_bloc/detail_bloc.dart';
import 'product_detail_bloc/detail_event.dart';
import 'product_detail_bloc/detail_state.dart';

class ProductDetailPage extends StatefulWidget{
  int mProductId;
  String imgUrl;
  String pName;
  String pPrice;

  ProductDetailPage({required this.mProductId, required this.imgUrl,required this.pName,required this.pPrice});

  @override
  State<ProductDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ProductDetailPage> {

  int qty = 1;
  bool isLoading = false;

  List<Map<String,dynamic>> listColor=[
    {
      'color':Colors.orange
    }, {
      'color':Colors.black
    }, {
      'color':Colors.brown
    }, {
      'color':Colors.blueGrey
    }, {
      'color':Colors.blue
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3e3e3),
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                        child: Icon(Icons.arrow_back_ios_new,size: 25,)),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                            child: Icon(Icons.share_outlined,size: 25,)),
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                            child: Center(child: Icon(Icons.favorite_border,size: 25,))),
                      ],
                    ),

                  ],
                ),
              ),
              Hero(tag: 'product',
              child: Image.network(widget.imgUrl,height: 300,width: 300,)),
              SizedBox(
                height: 500,
                child: Container(
                  height: 100,
                  width: 550,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.pName,style: mTextStyle16(),),
                          Text("\u{20B9}${widget.pPrice}",style: mTextStyle16()),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Seller : Jack',style: mTextStyle16(),),
                            ],),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffff660e),
                                ),
                                child: Center(
                                  child: Row(children: [
                                    Icon(Icons.star,color: Colors.white,),
                                    Text('4.8',style: TextStyle(fontSize: 12,color: Colors.white))
                                  ]),
                                ),
                              ),
                              Text(' (536 Review)',style: mTextStyle16(),),
                            ],),
                          Text('Color',style: mTextStyle16()),
                          SizedBox(
                            height: 65,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listColor.length, itemBuilder: (BuildContext c,i) =>
                                Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: listColor[i]['color']
                                  ),
                                )
                            ),
                          ),
                          Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Color(0xffff660e),
                                    ),
                                    child: Center(
                                      child: Text('Discription',style: mTextStyle16()),
                                    )
                                ),
                                Text('Specification',style: mTextStyle16(),),
                                Text('Review',style: mTextStyle16()),

                              ]),
                          Text('Airdopes Atom 81 offer a total playtime of up to 50HRS, including up to 10HRS of playtime per earbud.Clear Voice Call unwanted background noises during calls.',style: TextStyle(fontSize: 14,color: Colors.grey.shade600)),


                        ]),
                  ),
                ),),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff000000),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      height: 44,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          border: Border.all(color: Colors.white,width: 2,)
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: (){
                                if(qty>1){
                                  qty--;
                                  setState(() {

                                  });
                                }
                              },
                              child: Text('-',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                          Text('$qty',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
                          InkWell(
                              onTap: (){
                                qty++;
                                setState(() {

                                });
                              },
                              child: Text('+',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                  BlocListener<DetailBloc, DetailState>(
                    listener: (_, state){
                      if(state is DetailLoadingState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Adding..')));
                        isLoading = true;
                        setState(() {

                        });
                      } else if(state is DetailLoadedState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Cart successfully..')));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainHome(),));
                        isLoading = false;
                        setState(() {

                        });
                      } else if(state is DetailErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${state.errorMsg}')));
                        isLoading = false;
                        setState(() {

                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color(0xffff660e),
                          ),
                          child: Center(
                            child: isLoading ? Row(
                              children: [
                                CircularProgressIndicator(),
                                Text('Adding..')
                              ],
                            ) : InkWell(
                                onTap: (){
                                  context.read<DetailBloc>().add(AddToCartEvent(productId: widget.mProductId, qty: qty));
                                },
                                child: Text('Add to Cart',style: mTextStyle16(mColor: AppColoers.whiteColor))),
                          )
                      ),
                    ),
                  ),
                ]),

              ),
            ),
          ),
        ],
      ),
    );
  }
}