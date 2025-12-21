import 'package:json_annotation/json_annotation.dart';

part 'tenant_config_map.g.dart';

@JsonSerializable()
class TenantConfigMap {
  final String? businessPhone;
  final String? userAgreementCode;
  final String? privacyAgreementCode;
  final String? logo;
  final String? rechargeWorkflowCode;
  final String? withdrawWorkflowCode;
  final String? esignSealId;
  final String? cmbAccountName;
  final String? cmbCard;
  final String? realTimeBidCode;
  final String? qiyeWeChatCODE;
  final String? WeChatPublicCODE;
  final String? wechatCode;
  final String? reportPhone;
  final String? reportEmail;
  final String? fax;
  final String? email;
  final String? costReviewWorkflowCode;
  final String? Admissionquota;
  final String? UserRules;
  final String? autoCreateAdditionalCharge;
  final String? MobileCODE;
  final String? saleAfterAllowAdvance;
  final String? thirdBusinessDataWorkflowCode;
  final String? companyName;
  final String? domainFilingNo;

  TenantConfigMap({
    this.businessPhone,
    this.userAgreementCode,
    this.privacyAgreementCode,
    this.logo,
    this.rechargeWorkflowCode,
    this.withdrawWorkflowCode,
    this.esignSealId,
    this.cmbAccountName,
    this.cmbCard,
    this.realTimeBidCode,
    this.qiyeWeChatCODE,
    this.WeChatPublicCODE,
    this.wechatCode,
    this.reportPhone,
    this.reportEmail,
    this.fax,
    this.email,
    this.costReviewWorkflowCode,
    this.Admissionquota,
    this.UserRules,
    this.autoCreateAdditionalCharge,
    this.MobileCODE,
    this.saleAfterAllowAdvance,
    this.thirdBusinessDataWorkflowCode,
    this.companyName,
    this.domainFilingNo,
  });

  factory TenantConfigMap.fromJson(Map<String, dynamic> json) => _$TenantConfigMapFromJson(json);
  Map<String, dynamic> toJson() => _$TenantConfigMapToJson(this);
}
