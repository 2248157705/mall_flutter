import 'package:json_annotation/json_annotation.dart';

part 'order_detail_response.g.dart';

@JsonSerializable()
class OrderDetailResponse {
  final Map<String, dynamic> data;

  OrderDetailResponse({required this.data});

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) => _$OrderDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailResponseToJson(this);
}
