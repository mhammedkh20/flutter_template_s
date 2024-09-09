part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SuccessData extends HomeState {
  final List<UserModel> users;
  SuccessData(this.users);
}

class FailureData extends HomeState {
  final String message;
  FailureData(this.message);
}

class LoadingData extends HomeState {}

class RequestUpdateApp extends HomeState {}
