import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:flutter/widgets.dart';

class CustomIconUi extends StatelessWidget {
  double mWidth;
  double mHeight;
  Color? bgColor;
  Color? fgColor;
  IconData? mIcon;
  String? imgPath;

  CustomIconUi({ this.mWidth = 40,  this.mHeight = 40, this.bgColor  ,  this.fgColor,  this.mIcon, this.imgPath });




  @override
  Widget build(BuildContext context) {
    return  Container(
      width: mWidth,
       height: mHeight,
       decoration: BoxDecoration(
         color: bgColor ?? AppColoers.LightGreyColor,
         shape: BoxShape.circle

       ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: mIcon!=null ? Icon(mIcon, color:  fgColor ?? AppColoers.blackColor,) : Image.asset(imgPath!),
      ),
    );
  }
}
