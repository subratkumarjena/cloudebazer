import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_helper.dart';

part 'resister_event.dart';
part 'resister_state.dart';

class ResisterBloc extends Bloc<ResisterEvent, ResisterState> {
  ApiHelper apiHelper;
  ResisterBloc({required this.apiHelper}) : super(ResisterInitial()) {
    on<ResisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
