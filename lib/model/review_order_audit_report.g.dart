// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_order_audit_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewOrderAuditReport _$ReviewOrderAuditReportFromJson(
        Map<String, dynamic> json) =>
    ReviewOrderAuditReport(
      optionType: (json['optionType'] as num?)?.toInt(),
      parentOptionId: (json['parentOptionId'] as num?)?.toInt(),
      parentOptionName: json['parentOptionName'] as String?,
      optionName: json['optionName'] as String?,
      optionKey: json['optionKey'] as String?,
    );

Map<String, dynamic> _$ReviewOrderAuditReportToJson(
        ReviewOrderAuditReport instance) =>
    <String, dynamic>{
      'optionType': instance.optionType,
      'parentOptionId': instance.parentOptionId,
      'parentOptionName': instance.parentOptionName,
      'optionName': instance.optionName,
      'optionKey': instance.optionKey,
    };
