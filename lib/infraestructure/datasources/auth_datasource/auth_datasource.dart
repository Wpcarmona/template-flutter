import 'dart:convert';

import 'package:app_template/config/constants/environment.dart';
import 'package:app_template/domain/datasource/datasource.dart';
import 'package:app_template/domain/entities/entities.dart';
import 'package:app_template/infraestructure/mappers/mappers.dart';
import 'package:app_template/infraestructure/models/models.dart';
import 'package:dio/dio.dart';

class AuthSPDatasource extends AuthDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl,
  ));

  Login _jsonToLogin(Map<String, dynamic> json) {
    final loginResponse = LoginResponse.fromJson(json);

    return AuthMapper.loginToEntity(loginResponse);
  }

  Logout _jsonToLogout(Map<String, dynamic> json) {
    final logoutResponse = LogoutResponse.fromJson(json);
    return AuthMapper.logoutToEntity(logoutResponse);
  }

  Register _jsonToRegister(Map<String, dynamic> json) {
    final registerResponse = CreateUserResponse.fromJson(json);
    return AuthMapper.registerToEntity(registerResponse);
  }

  SendVerifyPhone _jsonToSendVerifyPhone(Map<String, dynamic> json) {
    final sendVerifyPhoneResponse = SendVerifyPhoneResponse.fromJson(json);
    return AuthMapper.sendVerifyPhoneToEntity(sendVerifyPhoneResponse);
  }

  VerifyPhone _jsonToVerifyPhone(Map<String, dynamic> json) {
    final verifyPhoneResponse = VerifyPhoneResponse.fromJson(json);
    return AuthMapper.verifyPhoneToEntity(verifyPhoneResponse);
  }

  ResetPassword _jsonToResetPassword(Map<String, dynamic> json) {
    final resetPasswordResponse = ResetPasswordResponse.fromJson(json);
    return AuthMapper.resetPasswordToEntity(resetPasswordResponse);
  }


  UpdatePassword _jsonToUpdatePassword(Map<String, dynamic> json) {
    final updatePasswordResponse = UpdatePasswordResponse.fromJson(json);
    return AuthMapper.updatePasswordToEntity(updatePasswordResponse);
  }

  UpdateUser _jsonToUpdateUser(Map<String, dynamic> json) {
    final updateUserResponse = UpdateUserResponse.fromJson(json);
    return AuthMapper.updateUserToEntity(updateUserResponse);
  }

  ResetPassWordValidate _jsonToResetPassWordValidate(Map<String, dynamic> json) {
    final resetPassWordValidateResponse = ValidateChannelResponse.fromJson(json);
    return AuthMapper.resetPassWordValidateToEntity(resetPassWordValidateResponse);
  }

  @override
  Future<Login> login({required String email, required String password}) async {
    final response = await dio.post(
      '/sessions/login',
      data: {
        "api_key": Environment.apiKey,
        "campaign": Environment.campaign,
        "participation": {
          "email": email,
          "password": password,
        }
      },
    );

    final Map<String, dynamic> responseData = jsonDecode(response.data);

    return _jsonToLogin(responseData);
  }

  @override
  Future<Logout> logout({required String token}) async {
    final response = await dio.post('/sessions/logout',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToLogout(responseData);
  }

  @override
  Future<Register> register(
      {required String name,
      required String email,
      required String phoneNumber,
      required String password,
      required String passwordConfirmation}) async {
    final response = await dio.post('/participants', data: {
      'api_key': Environment.apiKey,
      'campaign': Environment.campaign,
      'properties': {
        'name': name,
        'phone': phoneNumber,
        'email': email,
        'password': password,
        'password_confirm': passwordConfirmation
      }
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToRegister(responseData);
  }

  @override
  Future<SendVerifyPhone> sendVerifyPhone({required String userId}) async {
    final response = await dio
        .post('/validations/send_verify_phone', data: {'user_id': userId});
    return _jsonToSendVerifyPhone(response.data);
  }

  @override
  Future<VerifyPhone> verifyPhone(
      {required String userId, required String code}) async {
    final response = await dio.post('/validations/verify_phone',
        data: {'user_id': userId, 'code': code});
    return _jsonToVerifyPhone(response.data);
  }

  @override
  Future<ResetPassword> resetPassword({required String email}) async {
    final response = await dio.post('/passwords', data: {
      "api_key": Environment.apiKey,
      "campaign": Environment.campaign,
      "participation": {
        "email": email,
      },
      "notification_channel": "email"
    });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToResetPassword(responseData);
  }

  @override
  Future<UpdatePassword> updatePassword(
      {required String token,
      required String actualPassword,
      required String newPassword,
      required String newPasswordConfirmation}) async {
    final response = await dio.post('/passwords/change',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
        data: {
          "participation": {
            "current_password": actualPassword,
            "password": newPassword,
            "password_confirmation": newPasswordConfirmation
          }
        });
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUpdatePassword(responseData);
  }

  @override
  Future<UpdateUser> updateUser(
      {required String token, String? name, String? phone}) async {
    final Map<String, dynamic> data = {};

    if (name != null) data["name"] = name;
    if (phone != null) data["phone"] = phone;

    final response = await dio.post(
      '/participants/update',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
      data: data,
    );
    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToUpdateUser(responseData);
  }

  @override
  Future<ResetPassWordValidate> resetPassWordValidate(
      {required String email}) async {
    final response = await dio.post('/passwords/validate_channel', data: {
      "api_key": Environment.apiKey,
      "campaign": Environment.campaign,
      "email": email,
    });

    final Map<String, dynamic> responseData = jsonDecode(response.data);
    return _jsonToResetPassWordValidate(responseData);
  }
}
