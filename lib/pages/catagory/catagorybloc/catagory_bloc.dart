import 'package:bloc/bloc.dart';
import 'package:cloudbazar/domain/urls.dart';
import 'package:meta/meta.dart';

import '../../../data/model/catagory_model.dart';
import '../../../domain/api_helper.dart';

part 'catagory_event.dart';
part 'catagory_state.dart';

class CategoryBloc extends Bloc<CatagoryEvent,CatagoryState>{
  ApiHelper apiHelper;
  CategoryBloc({required this.apiHelper}):super(CatagoryInitialState()){
    on<Catagory>((event, emit) async {
      emit( CatagoryLodingState());
      try{
        dynamic data= await apiHelper.getApi(url: AppUrls.CATEGORY_URL);
        List<CategoryModel>mCategory=[];
        for(Map<String,dynamic> each in data['data']){
          mCategory.add(CategoryModel.fromJson(each));
        }
        emit(CatagoryLoadedState(data: mCategory));
      }catch(e){
        emit(CatagoryErrorState(Errormsg: (e.toString())));
      }
    });
  }
}
