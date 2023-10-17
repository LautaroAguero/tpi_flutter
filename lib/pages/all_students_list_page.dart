import 'package:flutter/material.dart';

class AllStudentsPage extends StatelessWidget {
  const AllStudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Estudiantes'),
      ),
      body: Center(
        child: Text('Lista de estudiantes'),
      ),
    );
  }
}
