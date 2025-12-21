// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      username: json['username'] as String,
      realName: json['realName'] as String?,
      phone: json['phone'] as String?,
      token: json['token'] as String,
      mainAccount: json['mainAccount'] as bool,
      mainCustomerId: (json['mainCustomerId'] as num?)?.toInt(),
      subAccountId: (json['subAccountId'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      remark: json['remark'] as String?,
      userType: json['userType'] as String?,
      buyType: json['buyType'] as String?,
      bindWechat: (json['bindWechat'] as num?)?.toInt(),
      tenantConfigMap: json['tenantConfigMap'] == null
          ? null
          : TenantConfigMap.fromJson(
              json['tenantConfigMap'] as Map<String, dynamic>),
      tenantId: (json['tenantId'] as num?)?.toInt(),
      extra: json['extra'] == null
          ? null
          : Extra.fromJson(json['extra'] as Map<String, dynamic>),
      locked: json['locked'] as bool?,
      subAccount: json['subAccount'] as bool?,
      superTenant: json['superTenant'] as bool?,
      menuList: (json['menuList'] as List<dynamic>?)
          ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'realName': instance.realName,
      'phone': instance.phone,
      'token': instance.token,
      'mainAccount': instance.mainAccount,
      'mainCustomerId': instance.mainCustomerId,
      'subAccountId': instance.subAccountId,
      'status': instance.status,
      'remark': instance.remark,
      'userType': instance.userType,
      'buyType': instance.buyType,
      'bindWechat': instance.bindWechat,
      'tenantConfigMap': instance.tenantConfigMap,
      'tenantId': instance.tenantId,
      'extra': instance.extra,
      'locked': instance.locked,
      'subAccount': instance.subAccount,
      'superTenant': instance.superTenant,
      'menuList': instance.menuList,
    };
