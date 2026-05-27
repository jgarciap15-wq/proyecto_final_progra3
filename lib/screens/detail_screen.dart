import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class DetailScreen extends StatelessWidget {

  final Todo tarea;

  const DetailScreen({
    super.key,
    required this.tarea,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Detalle de Tarea"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Center(

              child: CircleAvatar(

                radius: 50,

                backgroundColor:
                tarea.completed
                    ? Colors.green
                    : Colors.red,

                child: Icon(

                  tarea.completed
                      ? Icons.check
                      : Icons.close,

                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Título",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Text(
                  tarea.title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Información",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "ID Tarea: ${tarea.id}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "ID Usuario: ${tarea.userId}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(

                      tarea.completed
                          ? "Estado: Completada ✅"
                          : "Estado: Pendiente ❌",

                      style: TextStyle(
                        fontSize: 16,

                        color: tarea.completed
                            ? Colors.green
                            : Colors.red,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}