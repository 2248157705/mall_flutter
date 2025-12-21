import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  final int? id;
  final String? menuName;
  final int? menuType;
  final int? parentId;
  final String? path;
  final String? icon;
  final int? createUserId;
  final int? deletedFlag;
  final String? createTime;
  final String? updateTime;
  final int? updateUserId;

  Menu({
    this.id,
    this.menuName,
    this.menuType,
    this.parentId,
    this.path,
    this.icon,
    this.createUserId,
    this.deletedFlag,
    this.createTime,
    this.updateTime,
    this.updateUserId,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
