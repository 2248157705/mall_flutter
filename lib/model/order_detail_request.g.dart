// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailRequest _$OrderDetailRequestFromJson(Map<String, dynamic> json) =>
    OrderDetailRequest(
      orderId: (json['orderId'] as num).toInt(),
    );

Map<String, dynamic> _$OrderDetailRequestToJson(OrderDetailRequest instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
    };
