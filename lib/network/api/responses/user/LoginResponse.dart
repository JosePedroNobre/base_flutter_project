import 'package:json_annotation/json_annotation.dart';
import 'package:movies/network/api/model/User.dart';

part 'LoginResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  String token;
  @JsonKey(name: 'userEntity')
  User user;

  LoginResponse(this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
