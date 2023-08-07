import 'package:template_flutter_project/core/network/api.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';

abstract class HomeRepo {
  EitherType<GeneralResponse<String>> termsOfUse();
}
