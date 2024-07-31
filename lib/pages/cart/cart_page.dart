import 'dart:async';
import 'package:cloudbazar/pages/home_page.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../data/model/view_cart_model.dart';
import '../order/order_animation.dart';
import 'cart_bloc/cart_bloc.dart';
import 'chackout_bloc/checkout_bloc.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<CartPage> {

  bool isOrderPlacing = false;
  num totalAmt = 0.0;
  var  mdata;

  @override
  void initState() {
    super.initState();
    context.read<ViewCartBloc>().add(ViewCartEvent());
  }

  void getTotalAmountOfCartItems(List<ViewCartModel>? allItems){
    Timer(Duration(seconds: 1,), (){
      totalAmt = 0.0;
      for(ViewCartModel eachItem in allItems!){
        totalAmt += double.parse(eachItem.price!)*eachItem.quantity!;
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColoers.LightGreyColor,
        body:Column(
          children: [
            heightSpacing(mHeight: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColoers.whiteColor),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                      )),
                ),
                SizedBox(width: MediaQuery.of(context).size.width<600?110:MediaQuery.of(context).size.width>600&&MediaQuery.of(context).size.width<900?220:MediaQuery.of(context).size.width>900&&MediaQuery.of(context).size.width<1300?400:550),
                Text(
                  'My Cart',
                  style: mTextStyle25(),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<ViewCartBloc, ViewCartState>(
                  builder: (context, state) {
                    if (state is ViewCartLoadingState) {
                      return Center(child: CircularProgressIndicator(),);
                    } else if (state is ViewCartErrorState) {
                      totalAmt = 0.0;
                      return  Center(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Lottie.asset('assets/lottie/emptycart.json'),
                                height: 270,
                                width: 250,
                              ),
                              Text('Empty')
                            ],
                          ),
                        ),
                      );
                    } else if (state is ViewCartLoadedState) {
                      return  ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.viewCartData.length,
                        itemBuilder: (c, index) {
                          var data =state.viewCartData[index];
                          mdata = data;
                
                          if(index==state.viewCartData.length-1){
                            getTotalAmountOfCartItems(state.viewCartData);
                          }
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.width<900?130:170,
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(color: AppColoers.whiteColor,borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  widthSpacing(mWidth: 18),
                                  Container(
                                    height: MediaQuery.of(context).size.width<580?100:90,
                                    width: MediaQuery.of(context).size.width<580?90:90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffe3e3e3)),
                                    child: Image.network('${data.image}',height: 60.0,width: 50,),
                                  ),
                                  widthSpacing(),
                                  SizedBox(
                                    width: 210,
                                    child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            heightSpacing(mHeight: 20),
                                            Text('${data.name}',
                                                style: mTextStyle16(mFontWeight: FontWeight.bold),maxLines: 1,),
                                            heightSpacing(mHeight: 6),
                                            Text('\u{20B9}${data.price}',
                                                style: mTextStyle16()),
                                            heightSpacing(mHeight: 6),
                
                
                                            Container(
                                              height: 35,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: Color(0xffe3e3e3),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    '-',
                                                    style: mTextStyle16(),
                                                  ),
                                                  Text('${data.quantity}',
                                                      style: mTextStyle16()),
                                                  Text('+',
                                                      style: mTextStyle16()),
                                                ],
                                              ),
                                            ),
                
                                          ],
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 50.0),
                                    child: Container(
                                      child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 30),
                                    ),
                                  ),
                                  heightSpacing(mHeight: 40),
                
                
                                ],
                              ),
                            ),
                          );},
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),


          totalAmt >0  ?SizedBox(

            height: 300,
            child: Container(
              height: 100,
              width: 550,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, right: 15, left: 15),
                    child: Container(
                      height: 60,
                      width: 410,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColoers.LightGreyColor,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enter Discount Code',
                              style: mTextStyle16(),
                            ),
                            Text('Apply',
                                style: mTextStyle24(mColor: AppColoers.primaryColor))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: mTextStyle16(),
                        ),
                        mdata != null? Text('\₹$totalAmt',
                            style: mTextStyle16()):Container()
                      ],
                    ),
                  ),
                  Container(
                    height: 4,
                    width: 425,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffe3e3e3),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: mTextStyle16(),
                        ),
                        totalAmt>0? Text('\₹${totalAmt+totalAmt*0.1}',
                            style: mTextStyle16()):Text("0")
                      ],
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColoers.primaryColor,
                        ),
                        child: BlocListener<CheckoutBloc, CheckoutState>(
                          listener: (context, state){
                            if(state is CheckoutLoadingState){
                              isOrderPlacing = true;
                              setState(() {

                              });
                            } else if(state is CheckoutFailureState){
                              isOrderPlacing = false;
                              setState(() {

                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failde to place order: ${state.errorMsg}')));
                            } else if(state is CheckoutSuccessState){
                              isOrderPlacing = false;
                              setState(() {

                              });

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderAnim(),
                                  ));

                            }
                          },
                          child: isOrderPlacing ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 11,
                              ),
                              Center(
                                child: Text('Placing your Order..',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ),
                            ],
                          ) : Center(

                            child: InkWell(
                              onTap: (){
                                context.read<CheckoutBloc>().add(PlaceOrderEvent());
                              },
                              child: Text('Checkout',
                                  style: mTextStyle24(mColor: AppColoers.whiteColor)),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ):Container()

          ],
        ));

  }
}
