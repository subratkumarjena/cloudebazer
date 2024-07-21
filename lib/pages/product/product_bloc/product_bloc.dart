import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/product_model.dart';
import '../../../domain/api_helper.dart';
import '../../../domain/urls.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}) : super(ProductInitialState()) {
    on<getproduct>((event, emit) async {
      emit(ProductLoadingState());
      try{
        dynamic data= await apiHelper.postApi(url: AppUrls.PRODECT_URL,isHeader: true);
        var rawData=DataModel.fromJson(data);
        emit(ProductLoadedState(productdtas: rawData));

      }catch (e){
        emit(ProductErrorState(Errormsg: e.toString()));
      }
    });
  }
}
