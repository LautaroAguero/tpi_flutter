import 'package:flutter/material.dart';

class StudentsPerDebtPage extends StatelessWidget {
  const StudentsPerDebtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudiantes Deudores'),
      ),
      body: Center(
        child: Text('Lista de deudores'),
      ),
    );
  }
}
