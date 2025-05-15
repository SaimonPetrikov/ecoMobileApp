import 'package:eco_app/src/login/data/login.dart';
import 'package:eco_app/src/login/api/login_api.dart';

class LoginRepository {
  final LoginApi api;

  LoginRepository(this.api);

  Future<Login> login(String email, String password) async {
    final todayPhotoResponse = await api.login(LoginRequest(email: email, password: password));
    return Login.fromResponse(todayPhotoResponse);
  }
}