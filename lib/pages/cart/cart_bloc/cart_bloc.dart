import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/view_cart_model.dart';
import '../../../domain/api_helper.dart';
import '../../../domain/urls.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class ViewCartBloc extends Bloc<ViewCtEvent, ViewCartState> {
  ApiHelper apiHelper;
  ViewCartBloc({required this.apiHelper}) : super(ViewCartInitialState()) {
    on<ViewCartEvent>((event, emit) async {
      emit(ViewCartLoadingState());

      try{
        dynamic mData=await apiHelper.getApi(url: AppUrls.VIEW_CART_URL);
        print('API Response: $mData');
        if(mData['data']!= null){
          List<ViewCartModel> mList=[];
          for(Map<String,dynamic>each in mData['data']){
            mList.add(ViewCartModel.fromJson(each));
          }
          //var data=ViewCartModel.fromJson(mData);
          emit(ViewCartLoadedState(viewCartData: mList));
        }else{
          emit(ViewCartErrorState(msg: 'Empty'));
        }
        
      }catch(e){
        emit(ViewCartErrorState(msg: e.toString()));
      }
    });
  }
}
