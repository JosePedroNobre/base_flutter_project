import 'dart:async';
import 'dart:convert';

import 'package:movies/network/api/model/User.dart';
import 'package:movies/network/api/responses/user/LoginResponse.dart';
import 'package:movies/network/generic/BaseAPI.dart';

class UserRepository {
  BaseApi baseApi = BaseApi();

  Future<LoginResponse> authenticateUser(String name, String password) async {

    //request object
    User user = User(name, password);
    var body = json.encode(user);

    final response = await baseApi.post("user/login", body);
    return LoginResponse.fromJson(response);
  }
}
