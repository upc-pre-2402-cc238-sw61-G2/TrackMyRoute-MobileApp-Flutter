import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:trackmyroute_flutter/authentication/domain/user.dart';

class AuthService {
  final String _baseUrl = "https://track-my-route-web-services-cjf2ametdehhdshp.eastus-01.azurewebsites.net/";

  Future<User> signIn(String username, String password) async {
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
      return User(username: username, password: password);
    }

    return User(username: "", password: "");
  }  

  Future<User> signUP(String username, String password) async {
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
      return User(username: username, password: password);
    }

    return User(username: "", password: "");
  }  

}