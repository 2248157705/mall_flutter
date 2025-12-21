import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:login_app/model/login_request.dart';
import 'package:login_app/model/login_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST("/login-by-mobile")
  Future<LoginResponse> login(@Body() LoginRequest request);
}

Dio buildDioClient(String baseUrl) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;
  // If you want to see request logs, uncomment the following line
  // dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}
