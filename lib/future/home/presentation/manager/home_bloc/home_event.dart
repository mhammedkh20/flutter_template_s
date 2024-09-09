part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetUsersEvent extends HomeEvent {}

class CheckUpdateAppEvent extends HomeEvent {
  BuildContext context;
  CheckUpdateAppEvent(this.context);
}
