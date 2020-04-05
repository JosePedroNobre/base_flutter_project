import 'package:json_annotation/json_annotation.dart';

part 'UserLoginRequest.g.dart';

@JsonSerializable()
class UserLoginRequest {
  String email;
  String password;
  String profile;

  UserLoginRequest(this.email, this.password, this.profile);

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestToJson(this);
}
