
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloudbazar/coustom_ui/custom_icon_ui.dart';
import 'package:cloudbazar/coustom_ui/product_item.dart';
import 'package:cloudbazar/data/localdata/sliderdata.dart';
import 'package:cloudbazar/pages/catagory/catagorybloc/catagory_bloc.dart';
import 'package:cloudbazar/pages/product/product_bloc/product_bloc.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../coustom_ui/catagory_item.dart';
import 'cart_page.dart';
import 'mainhome.dart';
class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(Catagory());
    context.read<ProductBloc>().add(getproduct());
  }
  int selecedIndex = 0;
  List<Widget> navpage = [
    CartPage(),
    MainHome()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                /// App bar
                SizedBox(
                  height: 24,
                ),
                mAppBar(),
                heightSpacing(),
                /// Search bar
                searchbar(),

              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  children: [
                    /// Slider
                    slider(context),
                    heightSpacing(),
                    /// Category item
                    SizedBox(
                      height: 120,
                      child: CategoryItem(),
                    ),
                    heightSpacing(),
                    /// Grid product layout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' Special For You',
                          style: mTextStyle16(),
                        ),
                        Text(
                          ' See all ',
                          style: mTextStyle16(),
                        ),
                      ],
                    ),
    BlocBuilder<ProductBloc,ProductState>(
    builder: (_,state){
    if(state is ProductLoadingState){
    return Center(child: CircularProgressIndicator(),);
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
    return Container();},),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
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

        },
        child: Icon(Icons.home_outlined),
      ),
    );
  }
  Widget mAppBar(){
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconUi(mIcon: Icons.menu),
          CustomIconUi(mIcon: Icons.notifications_none),
        ],
      ),
    );
  }
}

Widget slider( BuildContext context){
  return  ClipRRect(
      borderRadius: BorderRadius.circular(08),
      child: CarouselSlider(items: SliderData.sliderimage.map((eachUrl){
        return SizedBox(
          width: double.infinity,
          child: Image.network(eachUrl,fit: BoxFit.fill,),
        );
      }).toList(), options: CarouselOptions(
          autoPlay: true,
          pageSnapping: false,
          viewportFraction: 1,
          height: MediaQuery.of(context).size.width<550?170:300
      )),
    );
}

Widget searchbar(){

  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColoers.LightGreyColor

    ),
    child: Row(
      children: [
        widthSpacing(),
        Icon(Icons.search, color: AppColoers.greyColor,),
        widthSpacing(),
        Expanded(child: Center(
          child: TextField(

            cursorHeight: 22,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Search',  // Optional: add a hint text if needed
              hintStyle: TextStyle(color: AppColoers.greyColor),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              border: InputBorder.none,  // No border
              enabledBorder: InputBorder.none,  // No border when enabled
              focusedBorder: InputBorder.none,  // No border when focused
              errorBorder: InputBorder.none,  // No border when there's an error
              disabledBorder: InputBorder.none,
            ),
          ),
        )),
        widthSpacing(),
        Container(width: 1,
        height: 20,
        color: AppColoers.blackColor,),
        widthSpacing(),
        Icon(Icons.filter_list, color: AppColoers.greyColor,),
        widthSpacing(),


      ],
    ),
  );
}

/*Widget catagory(){
  return CategoryItem();
}*/



/// Botton navbar
// BottomNavigationBar(
//   items: [
//     BottomNavigationBarItem(
//         icon: Icon(Icons.home),
//             label: "Home"
//     ),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.explore),
//         label: "Explore"
//     ),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.notifications),
//         label: "Notification"
//     ),
//     BottomNavigationBarItem(
//         icon: Icon(Icons.account_circle_outlined),
//         label: "Profile"
//     )
//   ],
//   unselectedItemColor: Colors.grey,
//   selectedItemColor: Colors.cyan,
//   currentIndex:selecedIndex,
//   onTap: (value){
//     selecedIndex = value;
//     setState(() {
//
//     });
//
//   },
// ),