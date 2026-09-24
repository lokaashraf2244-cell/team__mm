import 'package:dio/dio.dart';
import '../../features/auth/data/external/interceptor.dart';
import '../local_storage/base_local_storage.dart';
import 'api_constants.dart';

class DioFactory {
  static Dio create( {required BaseLocalStorage localStorage,
  } ) {

    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {

          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      AppInterceptors(
        localStorage: localStorage,
      ),
    );

    return dio;
  }
}