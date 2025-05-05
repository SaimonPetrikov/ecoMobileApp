import 'dart:convert';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/login_response.dart';

part 'login_state.dart';

/// State Management for [LoginState].
class LoginCubit extends Cubit<LoginState> {
  /// Set whatever active state of [LoginState] at the time.
  LoginCubit() : super(LoginInit());

  /// Authenticating user.
  auth({required String email, required String password}) async {
    // Set state as [LoginLoading].
    emit(LoginLoading());

    // Do POST to get response.
    // final Response response = await post(
    //   Uri.parse('https://demo.treblle.com/api/v1/auth/login'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': 'Bearer lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'email': email,
    //     'password': password,
    //   }),
    // );

    try {

      String resp = '{"code": 500, "message": "OK", "status": true, "user" :{"name": "John Smith","email": "john@example.com"}}';
      // Decode [Response] to [LoginOutput].
      LoginResponse output = LoginResponse.fromJson(jsonDecode(resp));

      // If the conditions are met return [LoginSucceed].
      //
      // Set state as [LoginSucceed].
      if (output.status == true && output.code == 200) {
        emit(LoginSucceed(response: output));
      }

      // Set state as [LoginFailed].
      else {
        emit(LoginFailed(message: 'Code ${output.code} : Login Failed'));
      }
    }
    // Catch exception from decoding [Response].
    //
    // [Set state as [LoginFailed].
    catch (e) {
      // Check whether email requirement is fulfilled or not.
      bool emailReq =
          email.contains('@') ? email.split('@').last.isNotEmpty : false;

      // Check whether password requirement is fulfilled or not.
      bool passReq = password.length >= 5;

      // A couple case of what message should be displayed to user.
      String message() {
        if (emailReq && !passReq) {
          return 'Password is invalid';
        } else if (!emailReq && passReq) {
          return 'Email is invalid';
        } else if (!emailReq && !passReq) {
          return 'Both Email and Password are invalid';
        } else {
          return e.toString();
        }
      }

      // Set state as [LoginFailed].
      emit(LoginFailed(message: message()));
    }
  }
}