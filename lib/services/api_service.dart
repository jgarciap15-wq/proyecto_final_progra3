import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo_model.dart';

class ApiService {

  final String url =
      "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todo>> obtenerTareas() async {

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data.map((json) =>
          Todo.fromJson(json)).toList();

    } else {

      throw Exception(
        "Error al cargar tareas",
      );
    }
  }
}