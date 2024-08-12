 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../coustom_ui/product_item.dart';
import '../../utils/app_coloers.dart';
import '../../utils/ui_helper.dart';
import '../product/product_bloc/product_bloc.dart';

class WishList extends StatefulWidget{
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(getproduct());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0,),
            child: Center(child: Text('My Wishlist',style: mTextStyle18(mFontWeight: FontWeight.bold),)),
          ),
          Expanded(child: BlocBuilder<ProductBloc,ProductState>(
            builder: (_,state){
              if (state is ProductLoadingState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: AppColoers.whiteColor,
                      child: Column(
                        children: List.generate(3, (index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(2, (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color:  Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(21),
                                ),

                                width: 170,
                                height: 200,
                                margin: EdgeInsets.all(2.0),

                              );
                            }),
                          );
                        }),
                      ),
                    ),
                  ),
                );
              }else if(state is ProductErrorState){
                return Center(child: Text(state.Errormsg),);
              }else if(state is ProductLoadedState){
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.productdtas.data!.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 210,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (_, index) {
                    var pData = state.productdtas.data!;
                    return ProductItemUi(mData: pData,index: index,);
                  },
                );

              }
              return Container();
            },),)
        ],
      ) ,

    );
  }
}