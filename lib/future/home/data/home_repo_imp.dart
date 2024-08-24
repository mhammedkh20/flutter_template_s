import 'package:template_flutter_project/core/network/api.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';
import 'package:template_flutter_project/future/home/models/user_model.dart';

class HomeRepoImp extends HomeRepo {
  final Api api;

  HomeRepoImp({required this.api});

  @override
  EitherType<GeneralResponse<List<UserModel>>> getUsers() {
    return api.users();
  }
}
