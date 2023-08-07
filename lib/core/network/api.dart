import 'package:dartz/dartz.dart';
import 'package:template_flutter_project/core/network/end_points.dart';
import 'package:template_flutter_project/core/services/dio_service.dart';
import 'package:template_flutter_project/future/home/models/general_response.dart';

typedef EitherType<T> = Future<Either<String, T>>;

class Api {
  final DioService dio;

  Api({required this.dio});

  EitherType<GeneralResponse<String>> termsOfUse() async {
    try {
      final response = await dio.dio.get(EndPoints.TERMS_OF_USE);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(GeneralResponse.fromJson(response.data));
      } else {
        return left(response.data['message']);
      }
    } catch (ex) {
      return left(ex.toString());
    }
  }
}
