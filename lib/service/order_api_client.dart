import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/model/order_detail_response.dart';
import 'package:login_app/model/order_list_response.dart';
import 'package:login_app/store/token_provider.dart';

part 'order_api_client.g.dart';

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class OrderDetailService {
  factory OrderDetailService(Dio dio, {String baseUrl}) = _OrderDetailService;
  @POST("/t-customer-order/query-detail")
  @FormUrlEncoded()
  Future<OrderDetailResponse> getOrderDetail(@Field("orderId") int orderId);
}

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class OrderService {
  factory OrderService(Dio dio, {String baseUrl}) = _OrderService;
  @POST("/t-customer-order/query")
  @Headers({"Content-Type": "application/json"})
  Future<HttpResponse<OrderListResponse>> queryOrders(
    @Body() Map<String, dynamic> request,
  );
}

// Provider for OrderService that uses the dioClientProvider
final orderServiceProvider = Provider.family<OrderService, String>((ref, baseUrl) {
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
  return OrderService(dio);
});



// // Provider for OrderDetailService that uses the dioClientProvider
// final orderDetailServiceProvider = Provider.family<OrderDetailService, String>((ref, baseUrl) {
//   final dio = ref.watch(dioClientProvider(baseUrl));
//   return OrderDetailService(dio);
// });


// Provider for OrderDetailService that uses the dioClientProvider
final orderDetailServiceProvider = Provider.family<OrderDetailService, String>((ref, baseUrl) {
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
  return OrderDetailService(dio);
});
