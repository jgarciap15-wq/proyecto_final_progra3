import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {

  final String usuario;

  const HomeScreen({
    super.key,
    required this.usuario,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ApiService apiService = ApiService();

  // Controlador buscador
  final TextEditingController searchController =
  TextEditingController();

  // Lista original
  List<Todo> tareas = [];

  // Lista filtrada
  List<Todo> tareasFiltradas = [];

  // ================= CARGAR DATOS =================

  Future<void> cargarTareas() async {

    tareas = await apiService.obtenerTareas();

    tareasFiltradas = tareas;

    setState(() {});
  }

  // ================= BUSCAR =================

  void buscarTareas(String texto) {

    setState(() {

      tareasFiltradas = tareas.where((tarea) {

        return tarea.title
            .toLowerCase()
            .contains(texto.toLowerCase());

      }).toList();

    });
  }

  // ================= INIT =================

  @override
  void initState() {
    super.initState();
    cargarTareas();
  }

  @override
  Widget build(BuildContext context) {

    // Estadísticas
    int completadas = tareas.where(
          (t) => t.completed,
    ).length;

    int pendientes = tareas.where(
          (t) => !t.completed,
    ).length;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Gestor de Tareas"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Column(

        children: [

          // ================= BIENVENIDA =================

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.blue,

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  "Bienvenido ${widget.usuario} 👋",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Total tareas: ${tareas.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                Text(
                  "Completadas: $completadas",
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 16,
                  ),
                ),

                Text(
                  "Pendientes: $pendientes",
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // ================= BUSCADOR =================

          Padding(
            padding: const EdgeInsets.all(15),

            child: TextField(

              controller: searchController,

              onChanged: buscarTareas,

              decoration: InputDecoration(

                hintText: "Buscar tarea...",

                prefixIcon:
                const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          // ================= LISTA =================

          Expanded(

            child: tareas.isEmpty

                ? const Center(
              child:
              CircularProgressIndicator(),
            )

                : ListView.builder(

              itemCount:
              tareasFiltradas.length,

              itemBuilder:
                  (context, index) {

                final tarea =
                tareasFiltradas[index];

                return Card(

                  margin:
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),

                  elevation: 5,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        15),
                  ),

                  child: ListTile(
                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) => DetailScreen(
                            tarea: tarea,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(

                      backgroundColor:
                      tarea.completed
                          ? Colors.green
                          : Colors.red,

                      child: Icon(

                        tarea.completed
                            ? Icons.check
                            : Icons.close,

                        color: Colors.white,
                      ),
                    ),

                    title: Text(
                      tarea.title,

                      style: const TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      "ID: ${tarea.id}",
                    ),

                    trailing: Text(

                      tarea.completed
                          ? "Completada"
                          : "Pendiente",

                      style: TextStyle(

                        color:
                        tarea.completed
                            ? Colors.green
                            : Colors.red,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}