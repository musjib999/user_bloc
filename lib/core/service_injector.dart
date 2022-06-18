import 'package:user_bloc/core/services/user_service.dart';

class ServiceInjector {
  UserService userService = UserService();
}

ServiceInjector si = ServiceInjector();
