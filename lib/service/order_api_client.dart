import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/model/order_detail_response.dart';
import 'package:login_app/service/api_client.dart';

part 'order_api_client.g.dart';

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class OrderDetailService {
  factory OrderDetailService(Dio dio, {String baseUrl}) = _OrderDetailService;

  @POST("/t-customer-order/query-detail")
  @FormUrlEncoded()
  Future<OrderDetailResponse> getOrderDetail(@Field("orderId") int orderId);
}

// Provider for OrderDetailService that uses the dioClientProvider
final orderDetailServiceProvider = Provider.family<OrderDetailService, String>((ref, baseUrl) {
  final dio = ref.watch(dioClientProvider(baseUrl));
  return OrderDetailService(dio);
});
