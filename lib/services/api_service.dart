import 'package:dio/dio.dart';
import '../models/user.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<List<User>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      
      if (response.statusCode == 200) {
        List<User> users = (response.data as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
        return users;
      } else {
        throw Exception('Falha ao carregar usuários');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }

  Future<User> getUserById(int id) async {
    try {
      final response = await _dio.get('/users/$id');
      
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Falha ao carregar usuário');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}