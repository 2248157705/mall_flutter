import 'package:json_annotation/json_annotation.dart';
import 'package:login_app/model/review_order_audit_report.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  final int? id;
  final String? orderCode;
  final int? bidOrderId;
  final String? bidOrderCode;
  final String? thirdOrderCode;
  final int? userId;
  final int? subCustomerId;
  final int? orderStatus;
  final int? channelId;
  final String? barcode;
  final String? orderSource;
  final String? orderTime;
  final int? modelId;
  final String? imei;
  final String? itemName;
  final String? skuId;
  final int? payStatus;
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
  final int? mark;
  final int? checkStatus;
  final int? deletedFlag;
  final String? createTime;
  final String? updateTime;
  final int? offerId;
  final int? logisticsSendCount;
  final int? resaleStatus;
  final int? currentPage;
  final int? pageSize;
  final String? customerName;
  final List<dynamic>? orderLabelList;
  final List<dynamic>? labelContentList;
  final List<ReviewOrderAuditReport>? reviewOrderAuditReportList;

  OrderDetail({
    this.id,
    this.orderCode,
    this.bidOrderId,
    this.bidOrderCode,
    this.thirdOrderCode,
    this.userId,
    this.subCustomerId,
    this.orderStatus,
    this.channelId,
    this.barcode,
    this.orderSource,
    this.orderTime,
    this.modelId,
    this.imei,
    this.itemName,
    this.skuId,
    this.payStatus,
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
    this.mark,
    this.checkStatus,
    this.deletedFlag,
    this.createTime,
    this.updateTime,
    this.offerId,
    this.logisticsSendCount,
    this.resaleStatus,
    this.currentPage,
    this.pageSize,
    this.customerName,
    this.orderLabelList,
    this.labelContentList,
    this.reviewOrderAuditReportList,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => _$OrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);
}
