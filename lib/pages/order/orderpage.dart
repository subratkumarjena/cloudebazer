import 'package:cloudbazar/pages/order/order_bloc/order_bloc.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../utils/app_coloers.dart';
class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}
class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderBloc>().add(getorderlist());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Center(child: Text('My Order',style: mTextStyle18(mFontWeight: FontWeight.bold),)),
          ),
          Expanded(
            child: Container(

                  child: BlocBuilder<OrderBloc, OrderState>(
                    builder: (_, state) {
                      if (state is OrderLoadingState) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is OrderErrorState) {
                        return Center(
                          child: Text(state.Errormsg),
                        );
                      } else if (state is OrderLoadedState) {
                        return ListView.builder(
                          itemCount: state.orderdata.orders?.length ?? 0,
                          itemBuilder: (BuildContext context, index) {
                            var order = state.orderdata.orders![index];
                            var formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.parse(order.created_at!));
                            return  Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                child: Container(
                                  color: AppColoers.whiteColor,
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(order.status.description, style: mTextStyle16(mFontWeight: FontWeight.bold),),
                                              SizedBox(height: 4),
                                              Text(
                                                formattedDate ?? '',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '₹${order.total_amount}',
                                            style: mTextStyle16(mFontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: order.product?.length ?? 0,
                                        itemBuilder: (context, childIndex) {
                                          var product = order.product![childIndex];
                                          return ListTile(
                                            leading: Container(
                                                decoration: BoxDecoration(
                                                  color: AppColoers.greyColor,
                                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Image.network(product.image ?? '',height: 90,),
                                                )),
                                            title: Text(product.name ?? ''),
                                            subtitle: Text('Price: ₹${product.price}, Quantity: ${product.quantity}'),

                                            trailing: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: AppColoers.primaryColor),

                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );

                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ),

          ),
        ],
      ),
    );
  }
}
