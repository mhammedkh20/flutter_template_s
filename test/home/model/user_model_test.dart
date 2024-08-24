import 'package:flutter_test/flutter_test.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';

void main() {
  test("fromJson convert json correctly", () {
    Map<String, dynamic> json = {
      "id": 1,
      "name": "Mohammed Khaled",
      "username": "mohammedkhaled2000",
      "email": "mhammedkhaled96@gmail.com",
      "phone": "+972594569213",
      "website": "http://mohammedkhaled.com",
    };

    UserModel user = UserModel.fromJson(json);
    expect(user.id, 1);
    expect(user.name, "Mohammed Khaled");
    expect(user.username, "mohammedkhaled2000");
    expect(user.email, "mhammedkhaled96@gmail.com");
    expect(user.phone, "+972594569213");
    expect(user.website, "http://mohammedkhaled.com");
  });

  test("fromJson handel null values", () {
    Map<String, dynamic> json = {
      "id": null,
      "name": null,
      "username": null,
      "email": null,
      "phone": null,
      "website": null,
    };

    UserModel user = UserModel.fromJson(json);
    expect(user.id, null);
    expect(user.name, null);
    expect(user.username, null);
    expect(user.email, null);
    expect(user.phone, null);
    expect(user.website, null);
  });

  test("fromJson handles with incomplete values", () {
    Map<String, dynamic> json = {
      "id": 1,
      "name": "mohammed khaled",
      "username": "mohammedkhaled2000",
      "email": null,
      "phone": null,
      "website": null,
    };

    UserModel user = UserModel.fromJson(json);
    expect(user.id, 1);
    expect(user.name, "mohammed khaled");
    expect(user.username, "mohammedkhaled2000");
    expect(user.email, null);
    expect(user.phone, null);
    expect(user.website, null);
  });
}
