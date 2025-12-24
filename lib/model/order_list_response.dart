import 'package:json_annotation/json_annotation.dart';

part 'order_list_response.g.dart';

@JsonSerializable()
class OrderListResponse {
  final int code;
  final OrderListData data;

  OrderListResponse({
    required this.code,
    required this.data,
  });

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListResponseToJson(this);
}

@JsonSerializable()
class OrderListData {
  final int total;
  final int currentPage;
  final int pageSize;
  final bool queryAll;
  final bool notFetchCount;
  final List<OrderItem> data;

  OrderListData({
    required this.total,
    required this.currentPage,
    required this.pageSize,
    required this.queryAll,
    required this.notFetchCount,
    required this.data,
  });

  factory OrderListData.fromJson(Map<String, dynamic> json) =>
      _$OrderListDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListDataToJson(this);
}

@JsonSerializable()
class OrderItem {
  final int id;
  final String orderCode;
  final int bidOrderId;
  final String bidOrderCode;
  final String thirdOrderCode;
  final int userId;
  final int subCustomerId;
  final int orderStatus;
  final int channelId;
  final String? barcode;
  final String? orderSource;
  final String? orderTime;
  final int modelId;
  final String? imei;
  final String? itemName;
  final String? skuId;
  final int payStatus;
  final String? payNo;
  final double? payAmount;
  final double? quoteAmount;
  final double? dealAmount;
  final String? receiveTime;
  final String? receiveName;
  final String? receivePhone;
  final String? receiveProvince;
  final String? receiveCity;
  final String? receiveArea;
  final String? receiveAddress;
  final String? orderRemark;
  final int mark;
  final int checkStatus;
  final int deletedFlag;
  final String? createTime;
  final String? updateTime;
  final int offerId;
  final int logisticsSendCount;
  final int resaleStatus;

  OrderItem({
    required this.id,
    required this.orderCode,
    required this.bidOrderId,
    required this.bidOrderCode,
    required this.thirdOrderCode,
    required this.userId,
    required this.subCustomerId,
    required this.orderStatus,
    required this.channelId,
    this.barcode,
    this.orderSource,
    this.orderTime,
    required this.modelId,
    this.imei,
    this.itemName,
    this.skuId,
    required this.payStatus,
    this.payNo,
    this.payAmount,
    this.quoteAmount,
    this.dealAmount,
    this.receiveTime,
    this.receiveName,
    this.receivePhone,
    this.receiveProvince,
    this.receiveCity,
    this.receiveArea,
    this.receiveAddress,
    this.orderRemark,
    required this.mark,
    required this.checkStatus,
    required this.deletedFlag,
    this.createTime,
    this.updateTime,
    required this.offerId,
    required this.logisticsSendCount,
    required this.resaleStatus,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}