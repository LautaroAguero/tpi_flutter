import 'package:flutter/material.dart';

class StudentsPerSubjectPage extends StatelessWidget {
  const StudentsPerSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.6),
        title: Text('Estudiantes por Materia'),
      ),
      body: Center(child: Text('Estudiantes por Materias')),
    );
  }
}
