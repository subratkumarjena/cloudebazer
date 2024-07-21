part of 'catagory_bloc.dart';

@immutable
sealed class CatagoryState {}

final class CatagoryInitialState extends CatagoryState {}
final class CatagoryLodingState extends CatagoryState {}
final class CatagoryLoadedState extends CatagoryState {

  List<CategoryModel> data;
  CatagoryLoadedState({required this.data});

}
final class CatagoryErrorState extends CatagoryState {
  String Errormsg;
  CatagoryErrorState({required this.Errormsg});

}
