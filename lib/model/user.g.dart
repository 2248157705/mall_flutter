// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      realName: json['realName'] as String,
      phone: json['phone'] as String,
      token: json['token'] as String,
      mainAccount: json['mainAccount'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'realName': instance.realName,
      'phone': instance.phone,
      'token': instance.token,
      'mainAccount': instance.mainAccount,
    };
