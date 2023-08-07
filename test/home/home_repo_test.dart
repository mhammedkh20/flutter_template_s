import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';

import 'home_repo_test.mocks.dart';

class HomeRepoTest extends Mock implements HomeRepo {}

@GenerateMocks([HomeRepoTest])
void main() {
  late MockHomeRepoTest homeRepo;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
  });
  test('Terms of Use - Success', () async {
    final modle = GeneralResponse<String>();

    final response = Right<String, GeneralResponse<String>>(modle);
    when(homeRepo.termsOfUse()).thenAnswer((realInvocation) async => response);

    final result = await homeRepo.termsOfUse();

    expect(result, response);
  });

  test('Terms of Use - Fuiler', () async {
    String response = '';

    final expected = Left<String, GeneralResponse<String>>(response);
    when(homeRepo.termsOfUse()).thenAnswer((realInvocation) async => expected);

    final result = await homeRepo.termsOfUse();

    expect(result, expected);
  });
}
