import 'package:cloudbazar/pages/authpage/loginb/login_bloc.dart';
import 'package:cloudbazar/pages/authpage/ui/signIn.dart';
import 'package:cloudbazar/utils/app_coloers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/api_helper.dart';
import 'pages/home_page.dart';
void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginBloc(apiHelper: ApiHelper()),),

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
      home:  LogIn(),
    );
  }
}

