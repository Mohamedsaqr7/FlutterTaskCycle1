abstract class HomePageState {}

class homePageInitState extends HomePageState {}

class productLoadingState extends HomePageState {}

class productSuccessState extends HomePageState {}

class productErrorState extends HomePageState {
  final String msg;
  productErrorState(this.msg);
}
final class UnauthenticatedState extends HomePageState {}

