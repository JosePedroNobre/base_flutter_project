import 'package:movies/network/api/responses/user/LoginResponse.dart';
import 'package:movies/network/generic/ApiResponse.dart';
import 'package:movies/repositories/UserRepository.dart';
import 'package:rxdart/rxdart.dart';

// using rx dart
class UserBloc {
  final userSubject = PublishSubject<ApiResponse<LoginResponse>>();

  Observable<ApiResponse<LoginResponse>> get authenticationUser => userSubject.stream;
  final _repository = UserRepository();

  authenticateUser(String email, String password) async {
    userSubject.sink.add(ApiResponse.loading("Logging"));
    try {
      // success
      LoginResponse loginResponse =
      await _repository.authenticateUser(email, password);
      userSubject.sink.add(ApiResponse.completed(loginResponse));
    } catch (e) {
      // error
      userSubject.sink.add(ApiResponse.error(e.toString()));
    }
  }

  dispose() {
    userSubject?.close();
  }
}
