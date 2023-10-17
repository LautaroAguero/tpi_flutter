import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:tpi_flutter/main.dart';
import 'package:http/http.dart' as http;
import 'package:tpi_flutter/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  Future<User?> signUserIn() async {
    final response = await http.post(
      Uri.parse('https://tpi-metodologia-grupo-3-2023.onrender.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'jeremias4@gmail.com',
        'password': '123456'
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(User.fromJson(jsonDecode(response.body)));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load login');
    }
  }

  //llamada a backend

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: 600,
            height: 600,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Iniciar Sesion',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    SizedBox(height: 60),

                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),

                    const SizedBox(height: 10),

                    const SizedBox(height: 25),
                    // sign in button
                    ElevatedButton(
                      onPressed: signUserIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: Size(200, 60),
                      ),
                      child: const Center(
                        child: Text(
                          "Iniciar Sesion",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
