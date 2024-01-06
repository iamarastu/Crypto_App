import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto_app/core/Repository/secureStorageRepository.dart';
import 'package:crypto_app/features/Auth/LogIn/Model/LoginRequestModel.dart';
import 'package:crypto_app/features/Auth/LogIn/Model/LoginResponseModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequestedEvent>(loginRequestedEvent);
    on<EmailUpdatedEvent>(emailUpdateEvent);
    on<PasswordUpdateEvent>(passwordUpdateEvent);
    on<LoginNavigateToRegisterEvent>(loginNavigateToRegisterEvent);
    on<LoginNavigateToForgetPasswordEvent>(loginNavigateToForgetPasswordEvent);
    on<LoginNavigateToTabsEvent>(loginNavigateToTabsEvent);
  }

//HANDEL the login Resuest of user
  FutureOr<void> loginRequestedEvent(
      LoginRequestedEvent event, Emitter<LoginState> emit) async {
    emit(LoginRequestProcessingState());

    var client = http.Client();

    var uri = Uri.parse("${dotenv.env["BACKEND"]!}/login");
    Map<String, String> reqHeaders = {"Content-Type": "application/json"};

    String reqBody = jsonEncode(event.loginRequest.toJson());

    var response = await client.post(uri, headers: reqHeaders, body: reqBody);
    try {
      switch (response.statusCode) {
        case 200:
          var loginResponse = loginResponseFromJson(response.body);
          emit(LoginRequestSucessState(token: loginResponse.token));
          print(loginResponse.token);
          await requestUserDataEvent();
          emit(LoginNavigateToTabsActionState());
          break;
        case 401:
          emit(LoginRequestErrorState());

          Fluttertoast.showToast(
              msg: "Invalid Credentials",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
          break;
        default:
          emit(LoginRequestErrorState());
          Fluttertoast.showToast(
              msg: "Login Failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
      }

      // if (response.statusCode == 200) {
      //   print(loginResponse.token);
      //   await requestUserDataEvent();
      //   emit(LoginNavigateToTabsActionState());
      // }
    } catch (error) {
      emit(LoginRequestErrorState());
      print("+++++++++++++++++++++++++++++++");
      print("Login Request Error: ${error} ");
    }
  }

//HANDEL the login Resuest of user
  FutureOr<void> requestUserDataEvent() async {
    var token = await SecureStorageRepository().getData('token');
    var client = http.Client();

    var uri = Uri.parse("${dotenv.env["BACKEND"]!}/user");
    Map<String, String> reqHeaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };
    http.Response response;
    try {
      response = await client.get(uri, headers: reqHeaders).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response(
              'Error', 408); // Request Timeout response status code
        },
      );
      //var userDataRes = userDataModelFromJson(response.body);

      switch (response.statusCode) {
        case 200:
          await SecureStorageRepository().saveData('user', response.body);
          break;
        case 401:
          Fluttertoast.showToast(
              msg: "Invalid Credentials",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
          break;
        default:
          Fluttertoast.showToast(
              msg: "Login Failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0);
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (_) {
      print('Timeout Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
  }

  FutureOr<void> emailUpdateEvent(
      EmailUpdatedEvent event, Emitter<LoginState> emit) {}

  FutureOr<void> passwordUpdateEvent(
      PasswordUpdateEvent event, Emitter<LoginState> emit) {}

  FutureOr<void> loginNavigateToRegisterEvent(
      LoginNavigateToRegisterEvent event, Emitter<LoginState> emit) {
    emit(LoginNavigateToRegisterActionState());
  }

  FutureOr<void> loginNavigateToForgetPasswordEvent(
      LoginNavigateToForgetPasswordEvent event, Emitter<LoginState> emit) {
    emit(LoginNavigateToForgetPasswordActionState());
  }

  FutureOr<void> loginNavigateToTabsEvent(
      LoginNavigateToTabsEvent event, Emitter<LoginState> emit) {
    emit(LoginNavigateToTabsActionState());
  }
}