import 'package:eco_app/src/login/data/login.dart';
import 'package:eco_app/src/login/data/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

/// State Management for [LoginState].
class LoginCubit extends Cubit<LoginState> {
  /// Set whatever active state of [LoginState] at the time.
  /// 
  final LoginRepository repository;

  LoginCubit(this.repository) : super(LoginInit());

  /// Authenticating user.
  auth({required String email, required String password}) async {
    // Set state as [LoginLoading].
    emit(LoginLoading());

    // Do POST to get response.

    // try {
      // Decode [Response] to [LoginOutput].
      final Login output = await repository.login(email, password);

      // If the conditions are met return [LoginSucceed].
      //
      // Set state as [LoginSucceed].
      if (output.status == true) {
        emit(LoginSucceed(response: output));
      } else {
        emit(LoginFailed(message: 'Login Failed'));
      }
    // } catch (e) {
    //   // Check whether email requirement is fulfilled or not.
    //   bool emailReq =
    //       email.contains('@') ? email.split('@').last.isNotEmpty : false;

    //   // Check whether password requirement is fulfilled or not.
    //   bool passReq = password.length >= 5;

    //   // A couple case of what message should be displayed to user.
    //   String message() {
    //     if (emailReq && !passReq) {
    //       return 'Password is invalid';
    //     } else if (!emailReq && passReq) {
    //       return 'Email is invalid';
    //     } else if (!emailReq && !passReq) {
    //       return 'Both Email and Password are invalid';
    //     } else {
    //       return e.toString();
    //     }
    //   }

    //   // Set state as [LoginFailed].
    //   emit(LoginFailed(message: message()));
    // }
  }
}