import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/model/login_request.dart';
import 'package:login_app/model/login_response.dart';
import 'package:login_app/store/token_provider.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @Headers(<String, dynamic>{
    "Content-Type": "application/x-www-form-urlencoded",
    "Referer": "https://servicewechat.com/wxc293f903839b892e/devtools/page-frame.html",
    "saas-tenant-code": "MAN_HAO_DE"
  })
  @POST("/login-by-mobile")
  Future<LoginResponse> login(@Body() LoginRequest request);
}

// Provider for Dio client that automatically uses the token from tokenProvider
final dioClientProvider = Provider.family<Dio, String>((ref, baseUrl) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;

  // Add interceptor to automatically include token in requests
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = ref.read(tokenProvider);
      if (token != null && token.isNotEmpty) {
        options.headers["Authorization"] = token;
      }
      handler.next(options);
    },
  ));
  
  dio.interceptors.add(LogInterceptor(requestHeader: true, requestBody: true, responseBody: true));
  return dio;
});

// Provider for LoginService that uses the dioClientProvider
final loginServiceProvider = Provider.family<LoginService, String>((ref, baseUrl) {
  final dio = ref.watch(dioClientProvider(baseUrl));
  return LoginService(dio);
});
