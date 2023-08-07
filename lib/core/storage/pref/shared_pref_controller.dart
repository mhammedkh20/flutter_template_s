import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_flutter_project/core/storage/pref/pref_keys.dart';

class SharedPrefController {
  static final SharedPrefController _instance =
      SharedPrefController._internal();

  late SharedPreferences _preferences;

  SharedPrefController._internal();

  factory SharedPrefController() => _instance;

  Future<SharedPreferences> initSharedPref() async =>
      _preferences = await SharedPreferences.getInstance();

  SharedPreferences get prefManager => _preferences;

  Future<bool> setToken(String token) async =>
      await _preferences.setString(PrefKeys.TOKEN, token);

  String? get getToken => _preferences.getString(PrefKeys.TOKEN);

  Future<bool> saveDataUser(User user) async {
    await _preferences.setInt(PrefKeys.ID_USER, user.id ?? -1);
    await _preferences.setString(PrefKeys.NAME_USER, user.name ?? "");
    await _preferences.setString(PrefKeys.PHONE_USER, user.phone ?? "");
    await _preferences.setString(PrefKeys.TOKEN, user.token ?? "");
    await _preferences.setString(PrefKeys.STATUS_USER, user.status ?? "");
    await _preferences.setString(PrefKeys.GENDER_USER, user.gender ?? "");
    await _preferences.setString(PrefKeys.IMAGE_USER, user.image ?? "");

    return await _preferences.setString(
        PrefKeys.BIRTH_DATE_USER, user.birthDate ?? "");
  }

  User getDataUser() {
    int id = _preferences.getInt(PrefKeys.ID_USER) ?? -1;
    String name = _preferences.getString(PrefKeys.NAME_USER) ?? "";
    String phone = _preferences.getString(PrefKeys.PHONE_USER) ?? "";
    String token = _preferences.getString(PrefKeys.TOKEN) ?? "";
    String status = _preferences.getString(PrefKeys.STATUS_USER) ?? "";
    String gender = _preferences.getString(PrefKeys.GENDER_USER) ?? "";
    String birthDate = _preferences.getString(PrefKeys.BIRTH_DATE_USER) ?? "";
    String image = _preferences.getString(PrefKeys.IMAGE_USER) ?? "";

    return User(
      id: id,
      name: name,
      phone: phone,
      birthDate: birthDate,
      token: token,
      status: status,
      gender: gender,
      image: image,
    );
  }

  Future<bool> setLang(String token) async =>
      await _preferences.setString(PrefKeys.LANG, token);

  String get getLang => _preferences.getString(PrefKeys.LANG) ?? 'ar';

  Future clearAllData() async {
    await _preferences.clear();
  }
}

// ! Fack class

class User {
  int? id;
  String? name;
  String? phone;
  String? birthDate;
  String? token;
  String? status;
  String? gender;
  String? image;

  User({
    required this.birthDate,
    required this.gender,
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.status,
    required this.token,
  });
}
