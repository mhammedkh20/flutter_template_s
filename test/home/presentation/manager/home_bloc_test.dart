import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';
import 'package:template_flutter_project/future/home/presentation/manager/home_bloc/home_bloc.dart';

import '../../domin/home_repo_test.mocks.dart';

void main() {
  late MockHomeRepoTest homeRepo;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
  });

  blocTest<HomeBloc, HomeState>(
    "Get Users - Success",
    build: () {
      when(homeRepo.getUsers()).thenAnswer((_) async =>
          right(GeneralResponse<List<UserModel>>(data: [UserModel()])));

      return HomeBloc(homeRepo);
    },
    act: (bloc) => bloc.add(GetUsersEvent()),
    expect: () => [isA<LoadingData>(), isA<SuccessData>()],
    verify: (bloc) => expect(bloc.users.length, 1),
  );

  blocTest<HomeBloc, HomeState>(
    "Get Users - Failuer",
    build: () {
      when(homeRepo.getUsers())
          .thenAnswer((_) async => left("there is error here"));

      return HomeBloc(homeRepo);
    },
    act: (bloc) => bloc.add(GetUsersEvent()),
    expect: () => [isA<LoadingData>(), isA<FailureData>()],
  );
}
