// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool,
      accessToken: json['accessToken'] as String,
      message: json['message'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'accessToken': instance.accessToken,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
    };
