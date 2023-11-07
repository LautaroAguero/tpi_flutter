import 'package:flutter/material.dart';

class StudentsPerSubjectPage extends StatefulWidget {
  const StudentsPerSubjectPage({Key? key}) : super(key: key);

  @override
  State<StudentsPerSubjectPage> createState() => _StudentsPerSubjectPage();
}

class _StudentsPerSubjectPage extends State<StudentsPerSubjectPage> {
  final List<Map<String, dynamic>> subjects = [
    {
      'nombre': 'Analisis Matematico',
      'aula': '103',
      'horario': '14:00 - 16:00',
      'estudiantes': [
        {
          'nombre': 'Matias Virgona',
        },
        {
          'nombre': 'Lautaro Agujero',
        },
        {
          'nombre': 'Elias Gomez',
        },
      ]
    },
    {
      'nombre': 'Algebra y Geometria Analitica',
      'aula': '104',
      'horario': '14:00 - 16:00',
      'estudiantes': [
        {
          'nombre': 'Lucia Fernandez',
        },
        {
          'nombre': 'Juan Perez',
        },
        {
          'nombre': 'Maria Rodriguez',
        },
      ]
    },
    {
      'nombre': 'Algoritmos y Estructuras de Datos',
      'aula': '105',
      'horario': '14:00 - 16:00',
      'estudiantes': [
        {
          'nombre': 'Pedro Martinez',
        },
        {
          'nombre': 'Ana Fernandez',
        },
        {
          'nombre': 'Sofia Garcia',
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: const Text('Estudiantes por Materias'),
      ),
      body: ListView(
        children: _createDataView(),
      ),
    );
  }

  List<Widget> _createDataView() {
    List<Widget> dataView = [];
    for (var subject in subjects) {
      dataView.add(Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          subject['nombre'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
      dataView.add(_createDataTable(subject));
      dataView.add(SizedBox(
        height: 30,
      ));
    }
    return dataView;
  }

  DataTable _createDataTable(Map<String, dynamic> subject) {
    List<Map<String, dynamic>> students =
        List<Map<String, dynamic>>.from(subject['estudiantes']);
    return DataTable(
      columns: _generateColumns(),
      rows: _generateRows(students),
      dividerThickness: 4,
      dataRowMaxHeight: 80,
      showBottomBorder: true,
      columnSpacing: 50,
    );
  }

  List<DataColumn> _generateColumns() {
    List<DataColumn> columns = [
      DataColumn(label: Text('N°')),
      DataColumn(label: Text('Nombre')),
    ];
    return columns;
  }

  List<DataRow> _generateRows(List<Map<String, dynamic>> students) {
    int order = 1;
    List<DataRow> rows = [];
    for (var student in students) {
      List<DataCell> cells = [
        DataCell(Text('${order++}')),
        DataCell(Text(student['nombre'])),
      ];
      rows.add(DataRow(cells: cells));
    }
    return rows;
  }
}
