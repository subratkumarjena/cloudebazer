
import 'package:cloudbazar/pages/authpage/ui/signup.dart';
import 'package:cloudbazar/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../domain/api_helper.dart';
import '../../../utils/app_coloers.dart';
import '../../../utils/ui_helper.dart';
import '../../mainhome.dart';
import '../loginb/login_bloc.dart';
import '../resisterbloc/resister_bloc.dart';

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogIn> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool isHide = true;
  final _FORM_KEY=GlobalKey<FormState>();
  bool isEmailValid(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _FORM_KEY,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('CloudBazar',
                  style: TextStyle(
                    fontSize: 30,
                  )),
              heightSpacing(),
              Container(
                height: 75,
                width: 500,
                child: TextFormField(
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return '*required';
                    }else if (!isEmailValid(value)){
                      return 'enter a valid email';
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      label: const Text('Email'),
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              heightSpacing(),
              Container(
                height: 75,
                width: 500,
                child: TextFormField(
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return '*required';
                    }
                    return null;
                  },
                  controller: passController,
                  decoration: InputDecoration(
                      label: Text('Password'),
                      hintText: 'Enter your Password',
                      suffixIcon: IconButton(onPressed: (){
                        isHide=!isHide;
                        setState(() {
                        });
                      },icon: Icon(isHide?Icons.visibility:Icons.visibility_off),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  obscureText: isHide,
                ),
              ),
              heightSpacing(),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginLodingState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            SizedBox(
                              child: Lottie.asset('assets/lottie/pro.json'),
                              height: 260,
                              width: 250,
                            ),
                          ],
                        )));
                  }

                  else if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.errorMsg)));
                  } else if (state is LoginLodadeState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainHome(),
                        ));
                  }
                },
                child: Container(
                  width: 340,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: ()  {
                        if(_FORM_KEY.currentState!.validate()){
                          context.read<LoginBloc>().add(Login(email:emailController.text.toString(), password:passController.text.toString()));
                        }
                      },
                      child: Text(
                        'Login',
                        style:
                        mTextStyle24(mColor: AppColoers.whiteColor),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
                        backgroundColor: AppColoers.primaryColor,
                      )),
                ),
              ),
              heightSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: mTextStyle16(mColor: AppColoers.primaryColor),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                  create: (context) =>
                                      ResisterBloc(apiHelper: ApiHelper()),
                                  child: Signup()),
                            ));
                      },
                      child: Text(
                        'Sign up',
                        style:
                        TextStyle(fontSize: 18, color: Colors.blue),
                      )),
                ],
              ),
            ],
          ),
        ),),
    );
  }
}