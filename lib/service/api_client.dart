import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:login_app/model/login_request.dart';
import 'package:login_app/model/login_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @Headers(<String, dynamic>{
    "Content-Type": "application/x-www-form-urlencoded",
    "Referer": "https://servicewechat.com/wxc293f903839b892e/devtools/page-frame.html",
    // "saas-tenant-code": "MAN_HAO_DE"
    "saas-tenant-code": "HUAN_JIN"
  })
  @POST("/login-by-mobile")
  Future<LoginResponse> login(@Body() LoginRequest request);
}

Dio buildDioClient(String baseUrl, {String? token}) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;

  if (token != null && token.isNotEmpty) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] = "$token";
        handler.next(options);
      },
    ));
  }
  
  dio.interceptors.add(LogInterceptor(requestHeader: true, requestBody: true, responseBody: true));
  return dio;
}
