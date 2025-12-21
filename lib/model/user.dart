import 'package:json_annotation/json_annotation.dart';
import 'package:login_app/model/extra.dart';
import 'package:login_app/model/tenant_config_map.dart';
import 'package:login_app/model/menu.dart'; // New import

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id; // Changed from int to String
  final String username;
  final String? realName;
  final String? phone;
  final String token;
  final bool mainAccount;
  final int? mainCustomerId;
  final int? subAccountId;
  final int? status;
  final String? remark;
  final String? userType;
  final String? buyType;
  final int? bindWechat;
  final TenantConfigMap? tenantConfigMap;
  final int? tenantId;
  final Extra? extra;
  final bool? locked;
  final bool? subAccount;
  final bool? superTenant;
  final List<Menu>? menuList; // New field

  User({
    required this.id,
    required this.username,
    this.realName,
    this.phone,
    required this.token,
    required this.mainAccount,
    this.mainCustomerId,
    this.subAccountId,
    this.status,
    this.remark,
    this.userType,
    this.buyType,
    this.bindWechat,
    this.tenantConfigMap,
    this.tenantId,
    this.extra,
    this.locked,
    this.subAccount,
    this.superTenant,
    this.menuList, // Added to constructor
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
