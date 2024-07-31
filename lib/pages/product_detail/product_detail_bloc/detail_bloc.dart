import 'package:bloc/bloc.dart';
import '../../../domain/api_helper.dart';
import '../../../domain/urls.dart';
import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState>{
  ApiHelper apiHelper;
  DetailBloc({required this.apiHelper}) : super(DetailInitialState()){

    on<AddToCartEvent>((event, emit) async{
      emit(DetailLoadingState());
      try{
        var mData = await apiHelper.postApi(url: AppUrls.ADD_TO_CART_URL, isHeader: true, mapData: {
          "product_id":event.productId,
          "quantity":event.qty
        });
        print("res add to cart : $mData");
        if(mData['status']=="true"){
          emit(DetailLoadedState());
        } else {
          emit(DetailErrorState(errorMsg: mData['message']));
        }
      } catch(e){
        emit(DetailErrorState(errorMsg: e.toString()));
      }

    });

  }
}