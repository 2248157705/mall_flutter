// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      id: (json['id'] as num?)?.toInt(),
      menuName: json['menuName'] as String?,
      menuType: (json['menuType'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      path: json['path'] as String?,
      icon: json['icon'] as String?,
      createUserId: (json['createUserId'] as num?)?.toInt(),
      deletedFlag: (json['deletedFlag'] as num?)?.toInt(),
      createTime: json['createTime'] as String?,
      updateTime: json['updateTime'] as String?,
      updateUserId: (json['updateUserId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'menuName': instance.menuName,
      'menuType': instance.menuType,
      'parentId': instance.parentId,
      'path': instance.path,
      'icon': instance.icon,
      'createUserId': instance.createUserId,
      'deletedFlag': instance.deletedFlag,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'updateUserId': instance.updateUserId,
    };
