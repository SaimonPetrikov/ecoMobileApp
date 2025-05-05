/// [Response] converter used in user's authentication.
class LoginResponse {
  /// Convert [Response] to readable [LoginResponse].
  const LoginResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.userName,
    required this.userEmail,
  });

  ///```json
  ///{"code": 200, ...}
  ///```
  final int code;

  ///```json
  ///{"status": true, ...}
  ///```
  final bool status;

  ///```json
  ///{"message": "User logged in", ...}
  ///```
  final String message;

  ///```json
  ///{"user":
  ///   {"name": "John Smith", ...}
  ///}
  ///```
  final String userName;

  ///```json
  ///{"user":
  ///   {"email": "sample@mail.com", ...}
  ///}
  ///```
  final String userEmail;

  /// Decode [Response] to [LoginResponse].
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      userName: json['user']['name'] as String,
      userEmail: json['user']['email'] as String,
    );
  }
}