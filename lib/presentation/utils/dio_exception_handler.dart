import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/presentation/providers/auth/auth_provider.dart';

typedef OnDioHandled = void Function(String message);

void handleDioException( DioException e, OnDioHandled onHandled, Ref ref) async {
  final responseData = jsonDecode(e.response?.data ?? '{}');
  String message = 'Error inesperado en la respuesta';

  if (responseData is Map<String, dynamic>) {
    if(responseData.containsKey('code_error') && responseData['code_error'] == 144) {
       await ref.read(authProvider.notifier).handleDeletedAccountOrExpirateToken();
      return;
    }
    final errorData = responseData['data'];
    if (errorData is Map<String, dynamic> && errorData.containsKey('message')) {
      message = errorData['message'];
    } else if (responseData.containsKey('message')) {
      message = responseData['message'];
    }
  }

  onHandled(message);
}


