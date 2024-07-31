abstract class DetailState{}
class DetailInitialState extends DetailState{}
class DetailLoadingState extends DetailState{}
class DetailLoadedState extends DetailState{}
class DetailErrorState extends DetailState{
  String errorMsg;
  DetailErrorState({required this.errorMsg});
}
