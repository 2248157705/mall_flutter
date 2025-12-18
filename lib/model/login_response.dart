import 'package:json_annotation/json_annotation.dart';
import 'package:login_app/model/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final User data;

  LoginResponse({required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
