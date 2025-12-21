import 'package:json_annotation/json_annotation.dart';

part 'extra.g.dart';

@JsonSerializable()
class Extra {
  final String? orderDetailVersion;

  Extra({this.orderDetailVersion});

  factory Extra.fromJson(Map<String, dynamic> json) => _$ExtraFromJson(json);
  Map<String, dynamic> toJson() => _$ExtraToJson(this);
}
