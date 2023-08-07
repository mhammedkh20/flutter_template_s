part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingData extends HomeState {}

class SuccessData extends HomeState {
  final String data;
  SuccessData(this.data);
}

class FailureData extends HomeState implements Equatable {
  final String message;
  FailureData(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

  @override
  // TODO: implement stringify
  bool? get stringify => false;
}
