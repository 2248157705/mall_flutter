import 'package:json_annotation/json_annotation.dart';
import 'package:login_app/model/order_detail.dart';

part 'order_detail_response.g.dart';

@JsonSerializable()
class OrderDetailResponse {
  final OrderDetail? data;

  OrderDetailResponse({this.data});

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) => _$OrderDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailResponseToJson(this);
}
