
import 'package:cloudbazar/pages/mainhome.dart';
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

  @override
  void initState() {
    super.initState();
    totalAmt = 0.0;
    context.read<ViewCartBloc>().add(ViewCartEvent());
  }

  void getTotalAmountOfCartItems(List<ViewCartModel>? allItems) {
    totalAmt = 0.0;
    if (allItems != null) {
      for (ViewCartModel eachItem in allItems) {
        totalAmt += double.parse(eachItem.price!) * eachItem.quantity!;
      }
    }
    // Ensure the UI is updated after calculating the total amount
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColoers.LightGreyColor,
      body: Column(
        children: [
          SizedBox(height: 24),
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
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainHome(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 600
                    ? 110
                    : MediaQuery.of(context).size.width > 600 &&
                    MediaQuery.of(context).size.width < 900
                    ? 220
                    : MediaQuery.of(context).size.width > 900 &&
                    MediaQuery.of(context).size.width < 1300
                    ? 400
                    : 550,
              ),
              Text(
                'My Cart',
                style: mTextStyle18(mFontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<ViewCartBloc, ViewCartState>(
                builder: (context, state) {
                  if (state is ViewCartLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ViewCartErrorState) {
                    totalAmt = 0.0;
                    return Center(
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
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      getTotalAmountOfCartItems(state.viewCartData);
                    });
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.viewCartData.length,
                      itemBuilder: (c, index) {
                        var data = state.viewCartData[index];

                        return CartItem(
                          data: data,
                          onUpdate: () {
                            getTotalAmountOfCartItems(state.viewCartData);
                          },
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
          totalAmt > 0
              ? SizedBox(
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
                                style: mTextStyle18(
                                    mColor: AppColoers.primaryColor))
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
                        Text('\₹$totalAmt', style: mTextStyle16())
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
                        Text('\₹${totalAmt + totalAmt * 0.1}',
                            style: mTextStyle16())
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
                          listener: (context, state) {
                            if (state is CheckoutLoadingState) {
                              setState(() {
                                isOrderPlacing = true;
                              });
                            } else if (state is CheckoutFailureState) {
                              setState(() {
                                isOrderPlacing = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Failed to place order: ${state.errorMsg}')));
                            } else if (state is CheckoutSuccessState) {
                              setState(() {
                                isOrderPlacing = false;
                                totalAmt = 0.0;
                              });
                              // Reset the cart and total amount
                              context.read<ViewCartBloc>().add(ViewCartEvent());
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderAnim(),
                                  ));
                            }
                          },
                          child: isOrderPlacing
                              ? Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
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
                          )
                              : Center(
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<CheckoutBloc>()
                                    .add(PlaceOrderEvent());
                              },
                              child: Text('Checkout',
                                  style: mTextStyle24(
                                      mColor: AppColoers.whiteColor)),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
              : Container()
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final ViewCartModel data;
  final VoidCallback onUpdate;

  CartItem({required this.data, required this.onUpdate});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int mqty;

  @override
  void initState() {
    super.initState();
    mqty = widget.data.quantity!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width < 900 ? 130 : 170,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColoers.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 18),
            Container(
              height: MediaQuery.of(context).size.width < 580 ? 100 : 90,
              width: MediaQuery.of(context).size.width < 580 ? 90 : 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffe3e3e3),
              ),
              child: Image.network(
                '${widget.data.image}',
                height: 60.0,
                width: 50,
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    '${widget.data.name}',
                    style: mTextStyle16(mFontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  SizedBox(height: 6),
                  Text('\u{20B9}${widget.data.price}', style: mTextStyle16()),
                  SizedBox(height: 6),
                  Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffe3e3e3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (mqty > 1) mqty--;
                            });
                            widget.data.quantity = mqty;
                            widget.onUpdate();
                            context.read<ViewCartBloc>().add(nAddToCartEvent(productId: widget.data.productId!, qty: mqty));
                          },
                          child: Text('--', style: mTextStyle24(mFontWeight: FontWeight.bold)),
                        ),
                        Text('$mqty', style: mTextStyle16()),
                        InkWell(
                          onTap: () {
                            setState(() {
                              mqty++;
                            });
                            widget.data.quantity = mqty;
                            widget.onUpdate();
                            context.read<ViewCartBloc>().add(nAddToCartEvent(productId: widget.data.productId!, qty: mqty));
                          },
                          child: Text('+', style: mTextStyle16()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                child: Icon(Icons.delete, color: Colors.red, size: 30),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

