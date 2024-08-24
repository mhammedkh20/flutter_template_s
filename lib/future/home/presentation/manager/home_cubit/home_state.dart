part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingData extends HomeState {}

class SuccessData extends HomeState {
  final List<UserModel> users;
  SuccessData(this.users);
}

class FailureData extends HomeState {
  final String message;
  FailureData(this.message);
}
