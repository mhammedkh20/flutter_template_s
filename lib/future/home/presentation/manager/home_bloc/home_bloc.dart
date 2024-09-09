import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_project/core/services/remoteconfig_servoce.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo repo;

  HomeBloc(this.repo) : super(HomeInitial()) {
    on<GetUsersEvent>(_showUsers);
    on<CheckUpdateAppEvent>(_checkUpdateApp);
  }

  List<UserModel> users = [];
  Future _showUsers(GetUsersEvent event, emit) async {
    emit(LoadingData());
    (await repo.getUsers()).fold(
      (l) {
        emit(FailureData(l));
      },
      (r) {
        users = r.data ?? [];
        emit(SuccessData(users));
      },
    );
  }

  Future _checkUpdateApp(CheckUpdateAppEvent event, emit) async {
    emit(LoadingData());
    bool check =
        await RemoteConfigService().checkOurAppForUpdate(event.context);
    if (!check) {
      add(GetUsersEvent());
    }
  }
}
