import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../data/app_prif.dart';
import 'api_exception.dart';
class ApiHelper{

  postApi({required String url,Map<String,dynamic>?mapData,bool isHeader=false}) async {
    var uri = Uri.parse(url);
    String token='';
    if(isHeader){
      token=await AppPrefs().getToken();
    }
    try{
      var data=await http.post(uri,body: mapData!=null?jsonEncode(mapData):{},headers: isHeader?{
        'Authorization' :'Bearer $token'
      }:{});
      return returnException(data);
    }on SocketException catch(e){
      throw(FetchDataException(errorMsg: 'No Internet'));
    }
  }
  getApi({required String url,}) async {
    var uri = Uri.parse(url);
    String token=await AppPrefs().getToken();

    try{
      var data=await http.get(uri,headers:{
        'Authorization' :'Bearer $token'
      });
      return returnException(data);
    }on SocketException catch(e){
      throw(FetchDataException(errorMsg: 'No Internet'));
    }
  }

  dynamic returnException(http.Response response){
    switch(response.statusCode){
      case 200:{
        var mData = jsonDecode(response.body);
        return mData;
      }
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      default:
        throw(FetchDataException(errorMsg: "Error occured while Communication with server : ${response.statusCode}"));
    }

  }
}

class AuthResponse{
  String? message;
  bool? status;
  String? token;
  AuthResponse({required this.status,required this.message,required this.token,});
}