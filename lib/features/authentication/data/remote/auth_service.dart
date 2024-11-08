import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:trackmyroute_flutter/core/constants/app_constants.dart';
import 'package:trackmyroute_flutter/core/utils/resource.dart';
import 'package:trackmyroute_flutter/features/authentication/data/remote/user_dto.dart';
import 'package:trackmyroute_flutter/features/authentication/data/remote/user_request.dart';

class AuthService {
  final String _signIn = '${AppConstants.baseUrl}authentication/sign-in';
  final String _signUp = '${AppConstants.baseUrl}authentication/sign-up';

  Future<Resource<UserDto>> signIn(String username, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(_signIn),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(UserRequest(username: username, password: password).toMap()),
      );
      
      if (response.statusCode == HttpStatus.ok){
        final Map<String, dynamic> json = jsonDecode(response.body);
        final UserDto userDto = UserDto.fromJson(json);
        return Success(userDto);
      } 
      return Error('Error: ${response.statusCode}');
    } catch (error){
      return Error('Error: ${error.toString()}');
    }
  }  

  Future<Resource<MessageDto>> signUp(String username, String password) async {
    try {
      http.Response response = await http.post(
        Uri.parse(_signUp),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(UserRequest(username: username, password: password).toMap()),
      );
      
      if (response.statusCode == HttpStatus.ok){
        final Map<String, dynamic> json = jsonDecode(response.body);
        final MessageDto messageDto = MessageDto.fromJson(json);
        return Success(messageDto);
      } 
      return Error('Error: ${response.statusCode}');
    } catch (error){
      return Error('Error: ${error.toString()}');
    }
  }  
}