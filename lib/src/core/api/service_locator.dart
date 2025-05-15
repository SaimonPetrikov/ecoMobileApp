import 'package:dio/dio.dart';
import 'package:eco_app/src/login/data/login_repository.dart';
import 'package:eco_app/src/login/api/login_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    await _registerNetwork();
    await _registerRepositories();
  }

  static Future<void> _registerNetwork() async {
    sl.registerSingleton(_buildDio());
    sl.registerSingleton(LoginApi(sl.get<Dio>()));
  }

  static Dio _buildDio() {
    BaseOptions options = BaseOptions(
      baseUrl: dotenv.get('API_URL'),
      connectTimeout: Duration(seconds: dotenv.getInt('CONNECTION_TIMEOUT')),
      receiveTimeout:  Duration(seconds: dotenv.getInt('RECEIVE_TIMEOUT')),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return Dio(options);
  }

  /// Register all the repositories
  static Future<void> _registerRepositories() async {
    sl.registerSingleton(LoginRepository(sl.get()));
  }
}