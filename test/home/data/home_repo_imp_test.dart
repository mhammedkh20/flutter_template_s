import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template_flutter_project/core/network/api.dart';
import 'package:template_flutter_project/future/home/data/home_repo_imp.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';
import 'home_repo_imp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Api>()])
void main() {
  late MockApi api;
  late HomeRepoImp homeRepoImp;

  setUpAll(() {
    api = MockApi();
    homeRepoImp = HomeRepoImp(api: api);
  });

  test("getUsers Successfuly", () async {
    when(api.users())
        .thenAnswer((_) async => right(GeneralResponse<List<UserModel>>(data: [
              UserModel(
                id: 1,
                name: "Mohammed Khaled",
                username: "mohammedkhaled2000",
                email: "mhammedkhaled96@gmail.com",
                phone: "+972594569213",
                website: "http://mohammed.com",
              )
            ])));

    final result = await homeRepoImp.getUsers();
    expect(result.isRight(), true);
    result.fold((String message) {
      log(message);
      fail("expect the right side");
    }, (GeneralResponse<List<UserModel>> data) {
      expect(data.data, isNotNull);
      expect(data.data!.length, 1);
      expect(data.data![0].name, "Mohammed Khaled");
    });
  });

  test("getUsers Failuer", () async {
    when(api.users()).thenAnswer((_) async => left("There Is Here Error"));

    final result = await homeRepoImp.getUsers();
    expect(result.isLeft(), true);
    result.fold((String message) {
      expect(message, "There Is Here Error");
    }, (GeneralResponse<List<UserModel>> data) {
      fail("expect the left side");
    });
  });
}
