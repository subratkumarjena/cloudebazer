import 'package:bloc/bloc.dart';
import 'package:cloudbazar/domain/urls.dart';
import 'package:meta/meta.dart';

import '../../../data/model/ordermodel.dart';
import '../../../domain/api_helper.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  ApiHelper apiHelper;
  OrderBloc({required this.apiHelper}) : super(OrderInitialState()) {
    on<getorderlist>((event, emit) async {
      emit(OrderLoadingState());
      try{
        dynamic mData = await apiHelper.postApi(url: AppUrls.FETCH_ALL_ORDER_URL,isHeader: true);
        var rData = OrderData.fromJson(mData);
        print('API Response: $mData');
        if(rData != null){
          emit(OrderLoadedState(orderdata: rData));
        }

      }catch(e){
        emit(OrderErrorState(Errormsg: e.toString()));
      }

    });
  }
}
