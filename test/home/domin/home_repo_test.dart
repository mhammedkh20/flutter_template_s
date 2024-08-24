import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';

import 'home_repo_test.mocks.dart';

class HomeRepoTest extends Mock implements HomeRepo {}

@GenerateMocks([HomeRepoTest])
void main() {
  late MockHomeRepoTest homeRepo;

  setUpAll(() {
    homeRepo = MockHomeRepoTest();
  });
  test('getUsers - Success', () async {
    final modle = GeneralResponse<List<UserModel>>();

    final response = Right<String, GeneralResponse<List<UserModel>>>(modle);
    when(homeRepo.getUsers()).thenAnswer((realInvocation) async => response);

    final result = await homeRepo.getUsers();

    expect(result, response);
  });

  test('getUsers - Fuiler', () async {
    String response = 'there is error';

    final expected = Left<String, GeneralResponse<List<UserModel>>>(response);
    when(homeRepo.getUsers()).thenAnswer((realInvocation) async => expected);

    final result = await homeRepo.getUsers();

    expect(result, expected);
  });
}
