import 'package:cloudbazar/pages/order/orderpage.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:cloudbazar/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200], // Replace AppColoers.LightGreyColor
        
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Container(
                height: 120,
                width: double.infinity,
                color: Colors.white, // Replace AppColoers.whiteColor
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0, top: 6.0),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:  AppColoers.primaryColor,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://st.depositphotos.com/46542440/55685/i/450/depositphotos_556851336-stock-illustration-square-face-character-stiff-art.jpg',
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return CircularProgressIndicator();
                            },
                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hello User', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('Hello@gmail.com', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15.0),
                      _buildSection(
                        height: 150,
                        children: [
                          _buildRow( context ,'Order', 'Wishlist',Icons.shopping_bag_outlined,Icons.favorite_outline_outlined),
                          SizedBox(height: 3.0),
                          _buildRow( context,'Coupons', 'Help',Icons.wallet_giftcard_outlined,Icons.help_outline_outlined),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      _buildSection(
                        title: 'Account Settings',
                        children: [
                          _buildIconRow(context,Icons.wallet_outlined, 'Saved Credit / Debit & Gift Cards'),
                          _buildIconRow(context,Icons.pin_drop_outlined, 'Saved Location'),
                          _buildIconRow(context,Icons.notifications_none_outlined, 'Notification Settings'),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      _buildSection(
                        title: 'Earn with Cloude Bazzer ',
                        children: [
                          _buildIconRow(context,Icons.star_border_outlined, 'Creator Studio'),
                          _buildIconRow(context,Icons.storefront_outlined, 'Sell on Cloud'),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      _buildSection(
                        title: 'feedback & Information ',
                        children: [
                          _buildIconRow(context,Icons.file_copy_outlined, 'Creator Studio'),
                          _buildIconRow(context,Icons.question_mark_outlined, 'Browse FAQs'),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      _buildSection(

                        children: [
                        Center(child: Text('Log Out',style: mTextStyle18(mColor: AppColoers.primaryColor),)),

                      ],),
                      SizedBox(height: 120.0),
                      
                    ],
                  ),
                ),
              )
              
            ],
          ),
        
      ),
    );
  }

  Widget _buildSection({double height = 300, String? title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 5.0)],
        color: Colors.white,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(title, style: mTextStyle16(mFontWeight: FontWeight.bold)),
            ),
          ],
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow( BuildContext context,String leftText, String rightText,IconData licon,IconData ricon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBox(context,leftText,licon),
          SizedBox(width: 15.0),
          _buildBox(context,rightText,ricon),
        ],
      ),
    );
  }

  Widget _buildBox(BuildContext context,String text,IconData icon) {
    return InkWell(
      onTap: () {
        if (text == 'Order') {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderPage()));
        }
      },
      child: Container(
        height: 45,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: AppColoers.LightGreyColor,
        ),
        child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Icon(icon,color: AppColoers.primaryColor),
            
            Text(text, style: mTextStyle16()),
          ],
        )),
      ),
    );
  }



  Widget _buildIconRow(BuildContext context,IconData icon, String text) {
    return InkWell(
      onTap: () {
        if (text == 'Saved Location') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved Location clicked')));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(icon, color: AppColoers.primaryColor),
            SizedBox(width: 10.0),
            Text(text, style: TextStyle(fontSize: 12)),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, size: 15, color: AppColoers.primaryColor),
          ],
        ),
      ),
    );
  }
}

