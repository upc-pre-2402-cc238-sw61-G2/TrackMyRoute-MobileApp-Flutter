import 'package:trackmyroute_flutter/features/authentication/domain/entities/reg_message.dart';
import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';

class UserDto {
  final int id;
  final String username;
  final String accessToken;

  const UserDto({
    required this.id,
    required this.username,
    required this.accessToken
  });

  factory UserDto.fromJson(Map<String, dynamic> json){
    return UserDto(
      id: json['id'] ?? 0, 
      username: json['usernam'] ?? '', 
      accessToken: json['token'] ?? '');
  }

  User toUser(){
    return User(id: id, username: username);
  }
}

class MessageDto {
  final String message;

  const MessageDto({
    required this.message,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json){
    return MessageDto(
      message: json['message'] ?? '', 
      );
  }

  RegMessage toMessage(){
    return RegMessage(message: message);
  }
}