import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadmartapplication/services/authintication_api_services.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final authenticationApiProvider = Provider<AuthenticationApi>((ref) {
  final dio = ref.read(dioProvider);
  return AuthenticationApi(dio);
});
