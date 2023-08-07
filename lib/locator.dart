import 'package:get_it/get_it.dart';
import 'package:template_flutter_project/core/network/api.dart';
import 'package:template_flutter_project/core/services/dio_service.dart';
import 'package:template_flutter_project/core/services/navigation_service.dart';
import 'package:template_flutter_project/future/home/data/home_repo_imp.dart';
import 'package:template_flutter_project/future/home/domin/home_repo.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DioService());

  Api api = Api(dio: locator<DioService>());
  locator.registerFactory<HomeRepo>(() => HomeRepoImp(api: api));
}
