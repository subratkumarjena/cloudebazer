import 'package:bloc/bloc.dart';
import 'package:cloudbazar/domain/urls.dart';
import 'package:meta/meta.dart';

import '../../../data/app_prif.dart';
import '../../../domain/api_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiHelper apiHelper;
  LoginBloc( {required this.apiHelper}) : super(LoginInitialState()) {
    on<Login>((event, emit)  async{
   emit(LoginLodingState());

   try{
     var mData= await apiHelper.postApi(url: AppUrls.LOGIN_URL,mapData:{"email":event.email, "password":event.password},);
     var loginData=AuthResponse(status: mData['status'], message: mData['message'], token: mData['tokan']);
     if(loginData.status! ){
       print('token : ${loginData.token}');
       AppPrefs().setToken(loginData.token!);
       emit(LoginLodadeState());
     }else{
       emit(LoginErrorState(errorMsg: '${loginData.message}'));
     }

   }catch(e){
     emit(LoginErrorState(errorMsg: e.toString()));
   }


    });
  }
}
