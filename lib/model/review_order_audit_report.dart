import 'package:json_annotation/json_annotation.dart';

part 'review_order_audit_report.g.dart';

@JsonSerializable()
class ReviewOrderAuditReport {
  final int? optionType;
  final int? parentOptionId;
  final String? parentOptionName;
  final String? optionName;
  final String? optionKey;

  ReviewOrderAuditReport({
    this.optionType,
    this.parentOptionId,
    this.parentOptionName,
    this.optionName,
    this.optionKey,
  });

  factory ReviewOrderAuditReport.fromJson(Map<String, dynamic> json) => _$ReviewOrderAuditReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewOrderAuditReportToJson(this);
}
