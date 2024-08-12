import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_helper.dart';
import '../../../domain/urls.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';





class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  ApiHelper apiHelper;
  CheckoutBloc({required this.apiHelper}) : super(CheckoutInitialState()) {
    on<PlaceOrderEvent>((event, emit) async {
      emit(CheckoutLoadingState());

      try {
        var mData = await apiHelper.postApi(url: AppUrls.PLACE_ORDER_URL, isHeader: true);

        print('API Response: $mData');

        if (mData != null) {
          print('Status: ${mData['status']}');
          print('Message: ${mData['message']}');
          print('Data: ${mData['data']}');

          if (mData['status'] != null && mData['status'] == true) {
            emit(CheckoutSuccessState());
          } else {
            String errorMsg = mData['message'] != null ? mData['message'] : 'Unknown error';
            emit(CheckoutFailureState(errorMsg: errorMsg));
          }
        } else {
          emit(CheckoutFailureState(errorMsg: "Response data is null"));
        }
      } catch (e) {
        emit(CheckoutFailureState(errorMsg: e.toString()));
      }
    });
  }
}
