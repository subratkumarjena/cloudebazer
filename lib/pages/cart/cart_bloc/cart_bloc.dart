import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/view_cart_model.dart';
import '../../../domain/api_helper.dart';
import '../../../domain/urls.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class ViewCartBloc extends Bloc<ViewCartEvents, ViewCartState> {
  ApiHelper apiHelper;

  ViewCartBloc({required this.apiHelper}) : super(ViewCartInitialState()) {
    on<ViewCartEvent>((event, emit) async {
      emit(ViewCartLoadingState());
      try {
        dynamic mData = await apiHelper.getApi(url: AppUrls.VIEW_CART_URL);
        print('API Response: $mData');
        if (mData['data'] != null) {
          List<ViewCartModel> mList = [];
          for (Map<String, dynamic> each in mData['data']) {
            mList.add(ViewCartModel.fromJson(each));
          }
          emit(ViewCartLoadedState(viewCartData: mList));
        } else {
          emit(ViewCartErrorState(msg: 'Empty'));
        }
      } catch (e) {
        emit(ViewCartErrorState(msg: e.toString()));
      }
    });

    on<nAddToCartEvent>((event, emit) async {
      emit(ViewCartLoadingState());
      try {
        var cData = await apiHelper.postApi(
            url: AppUrls.ADD_TO_CART_URL,
            isHeader: true,
            mapData: {
              "product_id": event.productId,
              "quantity": event.qty
            });
        print("Cart page add new item : $cData");

        if (cData['status'] == "true") {
          dynamic nData = await apiHelper.getApi(url: AppUrls.VIEW_CART_URL);
          print('API Response: $nData');
          if (nData['data'] != null) {
            List<ViewCartModel> mList = [];
            for (Map<String, dynamic> each in nData['data']) {
              mList.add(ViewCartModel.fromJson(each));
            }
            emit(ViewCartLoadedState(viewCartData: mList));
          } else {
            emit(ViewCartErrorState(msg: 'Empty'));
          }
        } else {
          emit(ViewCartErrorState(msg: 'Something wrong in cart'));
        }
      } catch (e) {
        emit(ViewCartErrorState(msg: e.toString()));
      }
    });
  }
}





/*
class ViewCartBloc extends Bloc<ViewCartEvent, ViewCartState> {
  ApiHelper apiHelper;
  ViewCartBloc({required this.apiHelper}) : super(ViewCartInitialState()) {

    @override
    Stream<ViewCartState> mapEventToState(ViewCartEvent event) async* {
      if (event is ViewCartEvent) {
        try {
          yield ViewCartLoadingState();
          dynamic mData=await apiHelper.getApi(url: AppUrls.VIEW_CART_URL);
          print('API Response: $mData');
          if(mData['data']!= null){
            List<ViewCartModel> mList=[];
            for(Map<String,dynamic>each in mData['data']){
              mList.add(ViewCartModel.fromJson(each));
            }
            yield ViewCartLoadedState(viewCartData: mList);
          }else{
            emit(ViewCartErrorState(msg: 'Empty'));
          }
        } catch (e) {
          yield ViewCartErrorState(msg: e.toString());
        }
      }
    }
  }*/

///
/*on<ViewCartEvent>(_onViewCart);
  Future<void> _onViewCart(ViewCartEvent event, Emitter<ViewCartState> emit) async {
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
  }*/
