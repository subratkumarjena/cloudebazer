
import 'package:cloudbazar/data/localdata/sliderdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/catagory/catagorybloc/catagory_bloc.dart';
import '../utils/ui_helper.dart';
import 'customprogress.dart';
class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CategoryBloc,CatagoryState>(
            builder: (_,state){
              if(state is CatagoryLodingState){
                return Center(child: Container());
              }else if(state is CatagoryErrorState){
                return Center(child: Text(state.Errormsg),);
              }else if(state is CatagoryLoadedState){

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mData = state.data[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(

                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: SliderData.cartimage != null
                                  ? Image.network(
                                SliderData.cartimage[index],
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return CustomCircularProgressIndicator();
                                },
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                  return Icon(Icons.error);
                                },
                              )
                                  : CustomCircularProgressIndicator(),
                            ),
                          ),
                        ),
                        Text(
                          '${mData.name}',
                          style: mTextStyle12(mFontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                );


              }
              return Container(

              );
            }

        ));
  }
}

