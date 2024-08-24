import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';
import 'package:template_flutter_project/future/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../domin/home_repo_test.mocks.dart';

void main() {
  late MockHomeRepoTest homeRepo;
  late HomeCubit homeCubit;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
    homeCubit = HomeCubit(homeRepo);
  });

  test('Get Terms - Success', () async {
    final modle = GeneralResponse<List<UserModel>>(data: [UserModel()]);

    final res = Right<String, GeneralResponse<List<UserModel>>>(modle);

    when(homeRepo.getUsers()).thenAnswer((realInvocation) async => res);

    await homeCubit.showUsers();

    expect(homeCubit.users.length, 1);
  });

  test('Get Terms - Failuer', () async {
    String errorMessage = 'mock Failuer';

    final res = Left<String, GeneralResponse<List<UserModel>>>(errorMessage);

    when(homeRepo.getUsers()).thenAnswer((realInvocation) async => res);

    await homeCubit.showUsers();

    expect((homeCubit.state is FailureData), true);
  });
}
