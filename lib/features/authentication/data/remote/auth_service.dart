import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:trackmyroute_flutter/shared/domain/entities/user.dart';

class AuthService {
  final String _baseUrl = "https://track-my-route-web-services-cjf2ametdehhdshp.eastus-01.azurewebsites.net/";

  Future<User> signIn(String username, String password) async {
    try {
      final uri = Uri.parse('$_baseUrl/api/v1/authentication/sign-in');
      final headers = {'Content-Type': 'application/json'};
      final encoding = Encoding.getByName('utf-8');
      Map<String, dynamic> body = {'username': username, 'password': password};
      String jsonBody = json.encode(body);
      
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding
      );
      
      if (response.statusCode == HttpStatus.ok){
        print("Sign in Successful.");
        return User(username: username, password: password);
      } else {
        print("Sign in Failed.");
        return User(username: "", password: "");
      }
    } catch (e){
      print("Error on signIn: $e");
      return User(username: "", password: "");
    }
  }  

  Future<User> signUp(String username, String password) async {
    try {
      final uri = Uri.parse('$_baseUrl/api/v1/authentication/sign-up');
      final headers = {'Content-Type': 'application/json'};
      final encoding = Encoding.getByName('utf-8');
      Map<String, dynamic> body = {'username': username, 'password': password};
      String jsonBody = json.encode(body);
      
      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding
      );

      if (response.statusCode == HttpStatus.ok){
        print("Sign up Successful.");
        return User(username: username, password: password);
      } else {
        print("Sign up Failed.");
        return User(username: "", password: "");
      }

    } catch (e){ 
      print("Error on signUp: $e");
      return User(username: "", password: "");
    }
  }  
}