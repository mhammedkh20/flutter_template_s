import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_flutter_project/core/services/remoteconfig_servoce.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitial());

  static HomeCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  GeneralResponse<String>? trems;

  Future getTermsOfUse() async {
    emit(LoadingData());
    (await repo.termsOfUse()).fold(
      (l) {
        emit(FailureData(l));
      },
      (r) {
        trems = r;
        emit(SuccessData(r.data ?? ""));
      },
    );
  }

  Future initHomeCubit(BuildContext context) async {
    emit(LoadingData());
    bool check = await RemoteConfigService().checkOurAppForUpdate(context);
    if (!check) {
      getTermsOfUse();
    }
  }
}
