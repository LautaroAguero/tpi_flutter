import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tpi_flutter/main.dart';
import 'package:http/http.dart' as http;
import 'package:tpi_flutter/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<User?> signUserIn() async {
    final response = await http.post(
      Uri.parse('https://tpi-metodologia-grupo-3-2023.onrender.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse['user']);
      print('${user.name} tiene rol de: ${user.role}');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(user: user),
        ),
      );
      return user;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
            child: Row(
              children: [
                Icon(
                  size: 20,
                  Icons.warning,
                  color: const Color.fromARGB(255, 252, 108, 108),
                ),
                SizedBox(width: 20),
                Text('email o contraseña incorrectos',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)))
              ],
            ),
          ),
          // ignore: use_build_context_synchronously
          backgroundColor: Theme.of(context).colorScheme.error));
      return null;
    }
  }

  //llamada a backend

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 600,
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
                              'Bienvenido de vuelta',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),

                        Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                'assets/brandIcon.svg',
                                semanticsLabel: 'Educar Logo',
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contraseña',
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        SizedBox(height: 40),
                        // sign in button
                        ElevatedButton(
                          onPressed: signUserIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            minimumSize: Size(200, 60),
                          ),
                          child: Center(
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
        ),
      ),
    );
  }
}
