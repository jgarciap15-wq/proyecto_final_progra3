import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController usuarioController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  String mensaje = "";

  void login() {

    String usuario = usuarioController.text;
    String password = passwordController.text;

    if (usuario == "jgarcia" && password == "12345") {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              HomeScreen(usuario: usuario),
        ),
      );

    } else {

      setState(() {
        mensaje = "Usuario o contraseña incorrectos ❌";
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(

          child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(25),

              child: Card(

                elevation: 15,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(25),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Icon(
                        Icons.security,
                        size: 90,
                        color: Colors.blue,
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Iniciar sesison",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextField(
                        controller: usuarioController,

                        decoration: InputDecoration(
                          labelText: "Usuario",
                          prefixIcon:
                          const Icon(Icons.person),

                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        controller: passwordController,
                        obscureText: true,

                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          prefixIcon:
                          const Icon(Icons.lock),

                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 50,

                        child: ElevatedButton(

                          onPressed: login,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(15),
                            ),
                          ),

                          child: const Text(
                            "Iniciar Sesión",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        mensaje,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}