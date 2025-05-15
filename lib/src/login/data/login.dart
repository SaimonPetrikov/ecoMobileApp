import 'package:eco_app/src/login/data/login_response.dart';

class Login {
  final bool status;
  final String accessToken;
  final String message;
  final String userName;
  final String userEmail;

  const Login({
    required this.status,
    required this.accessToken,
    required this.message,
    required this.userName,
    required this.userEmail
  });

  factory Login.fromResponse(LoginResponse response) => Login(
    status: response.status,
    accessToken: response.accessToken,
    message: response.message,
    userName: response.userName,
    userEmail: response.userEmail,
  );
}