import 'package:cloudbazar/coustom_ui/custom_icon_ui.dart';
import 'package:cloudbazar/coustom_ui/product_item.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'mainhome.dart';
class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body:Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.0),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              /// App bar
             mAppBar(),
              /// search bar
              heightSpacing(),
              searchbar(),
              heightSpacing(),

              /// gride product layout
              Expanded(child: GridView.builder(
                itemCount: 5,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 210,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                    childAspectRatio: 7/9
              ),
                  itemBuilder:(_, index){
                return ProductItemUi();

                  } ))
            ],
          ),
        ),
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

Widget searchbar(){

  return Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
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
        Icon(Icons.menu_open, color: AppColoers.greyColor,),
        widthSpacing(),


      ],
    ),
  );
}



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