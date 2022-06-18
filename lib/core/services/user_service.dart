import 'package:user_bloc/data/source/api.dart';
import 'package:user_bloc/model/api_response_model.dart';
import 'package:user_bloc/model/user_model.dart';

class UserService {
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> users = [];
    try {
      ApiResponseModel? response =
          await getRequest('https://jsonplaceholder.typicode.com/users');
      if (response!.statusCode == 200) {
        for (dynamic singleUser in response.body) {
          UserModel user = UserModel.fromJson(singleUser);
          users.add(user);
        }
      } else {
        users = [];
      }
    } catch (e) {
      users = [];
    }
    return users;
  }

  Future<UserModel?> getSingleUser(int id) async {
    UserModel? user;
    try {
      ApiResponseModel? response =
          await getRequest('https://jsonplaceholder.typicode.com/users/$id');
      if (response!.statusCode == 200) {
        user = UserModel.fromJson(response.body);
      } else {
        user = null;
      }
    } catch (e) {
      user = null;
    }
    return user;
  }
}
