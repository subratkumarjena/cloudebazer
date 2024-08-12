import 'package:cloudbazar/pages/authpage/loginb/login_bloc.dart';
import 'package:cloudbazar/pages/authpage/ui/signIn.dart';
import 'package:cloudbazar/pages/cart/cart_bloc/cart_bloc.dart';
import 'package:cloudbazar/pages/cart/chackout_bloc/checkout_bloc.dart';
import 'package:cloudbazar/pages/catagory/catagorybloc/catagory_bloc.dart';
import 'package:cloudbazar/pages/order/order_bloc/order_bloc.dart';
import 'package:cloudbazar/pages/product/product_bloc/product_bloc.dart';
import 'package:cloudbazar/pages/product_detail/product_detail_bloc/detail_bloc.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/api_helper.dart';
import 'flashscreen.dart';
import 'pages/home_page.dart';
void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => CategoryBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => ProductBloc(apiHelper: ApiHelper()),),
    BlocProvider<DetailBloc>(create: (context) => DetailBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => ViewCartBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => CheckoutBloc(apiHelper: ApiHelper()),),
    BlocProvider(create: (context) => OrderBloc(apiHelper: ApiHelper()),),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Bazar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColoers.primaryColor),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
    );
  }
}
class SlowPageRoute<T> extends MaterialPageRoute<T> {
  SlowPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => Duration(milliseconds: 1800);

  @override
  Duration get reverseTransitionDuration => Duration(milliseconds: 900);
}

