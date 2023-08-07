import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
import 'package:template_flutter_project/future/home/presentation/manager/home_cubit/home_cubit.dart';

import 'home_repo_test.mocks.dart';

void main() {
  late MockHomeRepoTest homeRepo;
  late HomeCubit homeCubit;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
    homeCubit = HomeCubit(homeRepo);
  });

  test('Get Terms - Success', () async {
    final modle = GeneralResponse<String>();

    final res = Right<String, GeneralResponse<String>>(modle);

    when(homeRepo.termsOfUse()).thenAnswer((realInvocation) async => res);

    await homeCubit.getTermsOfUse();

    expect(homeCubit.trems, modle);
  });

  test('Get Terms - Failuer', () async {
    String errorMessage = 'mock Failuer';

    final res = Left<String, GeneralResponse<String>>(errorMessage);

    when(homeRepo.termsOfUse()).thenAnswer((realInvocation) async => res);

    await homeCubit.getTermsOfUse();

    expect((homeCubit.state is FailureData), true);
  });
}
