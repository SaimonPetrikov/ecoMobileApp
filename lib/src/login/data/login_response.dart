import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {

  const LoginResponse({
    required this.status,
    required this.accessToken,
    required this.message,
    required this.userName,
    required this.userEmail,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  final bool status;
  final String message;
  final String accessToken;
  final String userName;
  final String userEmail;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}