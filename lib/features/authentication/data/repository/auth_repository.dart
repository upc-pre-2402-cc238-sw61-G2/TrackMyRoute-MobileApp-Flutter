import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/authentication/domain/entities/reg_message.dart';
import 'package:trackmyroute_flutter/features/authentication/data/remote/auth_service.dart';
import 'package:trackmyroute_flutter/features/authentication/data/remote/user_dto.dart';
import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';

class AuthRepository {
  Future<Resource<User>> signIn(String username, String password) async {
    Resource<UserDto> result = await AuthService().signIn(username, password);

    if (result is Success) {
      return Success(result.data!.toUser());
    } else {
      return Error(result.message!);
    }
  }

  Future<Resource<RegMessage>> signUp(String username, String password) async {
    Resource<MessageDto> result = await AuthService().signUp(username, password);

    if (result is Success) {
      return Success(result.data!.toMessage());
    } else {
      return Error(result.message!);
    }
  }
}
