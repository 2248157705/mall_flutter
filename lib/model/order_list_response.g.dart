// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListResponse _$OrderListResponseFromJson(Map<String, dynamic> json) =>
    OrderListResponse(
      code: (json['code'] as num).toInt(),
      data: OrderListData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderListResponseToJson(OrderListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };

OrderListData _$OrderListDataFromJson(Map<String, dynamic> json) =>
    OrderListData(
      total: (json['total'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      queryAll: json['queryAll'] as bool,
      notFetchCount: json['notFetchCount'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderListDataToJson(OrderListData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'queryAll': instance.queryAll,
      'notFetchCount': instance.notFetchCount,
      'data': instance.data,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: (json['id'] as num).toInt(),
      orderCode: json['orderCode'] as String,
      bidOrderId: (json['bidOrderId'] as num).toInt(),
      bidOrderCode: json['bidOrderCode'] as String,
      thirdOrderCode: json['thirdOrderCode'] as String,
      userId: (json['userId'] as num).toInt(),
      subCustomerId: (json['subCustomerId'] as num).toInt(),
      orderStatus: (json['orderStatus'] as num).toInt(),
      channelId: (json['channelId'] as num).toInt(),
      barcode: json['barcode'] as String?,
      orderSource: json['orderSource'] as String?,
      orderTime: json['orderTime'] as String?,
      modelId: (json['modelId'] as num).toInt(),
      imei: json['imei'] as String?,
      itemName: json['itemName'] as String?,
      skuId: json['skuId'] as String?,
      payStatus: (json['payStatus'] as num).toInt(),
      payNo: json['payNo'] as String?,
      payAmount: (json['payAmount'] as num?)?.toDouble(),
      quoteAmount: (json['quoteAmount'] as num?)?.toDouble(),
      dealAmount: (json['dealAmount'] as num?)?.toDouble(),
      receiveTime: json['receiveTime'] as String?,
      receiveName: json['receiveName'] as String?,
      receivePhone: json['receivePhone'] as String?,
      receiveProvince: json['receiveProvince'] as String?,
      receiveCity: json['receiveCity'] as String?,
      receiveArea: json['receiveArea'] as String?,
      receiveAddress: json['receiveAddress'] as String?,
      orderRemark: json['orderRemark'] as String?,
      mark: (json['mark'] as num).toInt(),
      checkStatus: (json['checkStatus'] as num).toInt(),
      deletedFlag: (json['deletedFlag'] as num).toInt(),
      createTime: json['createTime'] as String?,
      updateTime: json['updateTime'] as String?,
      offerId: (json['offerId'] as num).toInt(),
      logisticsSendCount: (json['logisticsSendCount'] as num).toInt(),
      resaleStatus: (json['resaleStatus'] as num).toInt(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'orderCode': instance.orderCode,
      'bidOrderId': instance.bidOrderId,
      'bidOrderCode': instance.bidOrderCode,
      'thirdOrderCode': instance.thirdOrderCode,
      'userId': instance.userId,
      'subCustomerId': instance.subCustomerId,
      'orderStatus': instance.orderStatus,
      'channelId': instance.channelId,
      'barcode': instance.barcode,
      'orderSource': instance.orderSource,
      'orderTime': instance.orderTime,
      'modelId': instance.modelId,
      'imei': instance.imei,
      'itemName': instance.itemName,
      'skuId': instance.skuId,
      'payStatus': instance.payStatus,
      'payNo': instance.payNo,
      'payAmount': instance.payAmount,
      'quoteAmount': instance.quoteAmount,
      'dealAmount': instance.dealAmount,
      'receiveTime': instance.receiveTime,
      'receiveName': instance.receiveName,
      'receivePhone': instance.receivePhone,
      'receiveProvince': instance.receiveProvince,
      'receiveCity': instance.receiveCity,
      'receiveArea': instance.receiveArea,
      'receiveAddress': instance.receiveAddress,
      'orderRemark': instance.orderRemark,
      'mark': instance.mark,
      'checkStatus': instance.checkStatus,
      'deletedFlag': instance.deletedFlag,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'offerId': instance.offerId,
      'logisticsSendCount': instance.logisticsSendCount,
      'resaleStatus': instance.resaleStatus,
    };
