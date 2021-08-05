import 'package:app/commons/api.dart';
import 'package:app/domain/auth/model/signUpUser.dart';
import 'package:app/domain/response.dart';
import 'package:app/domain/user/user.dart';
import 'package:app/domain/user/user_service.dart';
import 'package:dio/dio.dart';

/// Author: Ibekason Alexander

class UserServiceImpl extends UserService {
  @override
  Future<ResponseEntity> getUserById(String id) async {
    Response response;
    try {
      response =
          await dioClient
              .get(
        "/students/$id",
      );

      var user = User.fromServer(response.data["data"]);
      print("user from server $user");
      return ResponseEntity.Data(user);
    } on DioError catch (e) {
      print("DioError: ${e.error} and ${e.response}");
      return ResponseEntity.Error("An error occurred fetching user");
    } catch (e) {
      print("Exception $e");
      return ResponseEntity.Error("An error occurred fetching user");
    }
  }
}
