import 'package:json_annotation/json_annotation.dart';

part 'order_detail_request.g.dart';

@JsonSerializable()
class OrderDetailRequest {
  final int orderId;

  OrderDetailRequest({required this.orderId});

  factory OrderDetailRequest.fromJson(Map<String, dynamic> json) => _$OrderDetailRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailRequestToJson(this);
}
