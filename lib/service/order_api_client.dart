import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:login_app/model/order_detail_request.dart';
import 'package:login_app/model/order_detail_response.dart';

part 'order_api_client.g.dart';

@RestApi(baseUrl: "https://testenv.huanjintech.com/api/gtw/xgj-mall-api/")
abstract class OrderDetailService {
  factory OrderDetailService(Dio dio, {String baseUrl}) = _OrderDetailService;

  @Headers(<String, dynamic>{
    "Content-Type": "application/x-www-form-urlencoded",
  })
  @POST("/t-customer-order/query-detail")
  Future<OrderDetailResponse> getOrderDetail(
    @Body() OrderDetailRequest request,
  );
}
