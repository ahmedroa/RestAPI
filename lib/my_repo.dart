// ignore_for_file: unused_local_variable

import 'package:restapi/user.dart';
import 'package:restapi/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    // List<User> response;
    var response = await webServices.getAllUsers();

    return response.map((user) => User.fromJson(user.toJson())).toList();
  }

  Future<User> getUserById(String userId) async {
    var response = await webServices.getUserById(userId);
    return User.fromJson(response.toJson());
    // return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser) async {
    // try {
    return await webServices.createNewUser(newUser,
        'Bearer 6cccae6d2c952cd0ac1c849af8395dab4a0532a51c2b16637754740c165b6fcc');

    //     return ApiResult.success(response);

//     } catch (error) {
//       return ApiResult.failure(NetworkExceptions.getDioException(error));
//     }
  }

  Future<dynamic> deleteUser(String id) async {
    return await webServices.deleteUser(id,
        'Bearer 6cccae6d2c952cd0ac1c849af8395dab4a0532a51c2b16637754740c165b6fcc');
  }
}
