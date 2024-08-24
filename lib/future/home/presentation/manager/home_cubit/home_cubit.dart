import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_flutter_project/core/services/remoteconfig_servoce.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<UserModel> users = [];

  Future showUsers() async {
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

  Future initHomeCubit(BuildContext context) async {
    emit(LoadingData());
    bool check = await RemoteConfigService().checkOurAppForUpdate(context);
    if (!check) {
      showUsers();
    }
  }
}
