import 'package:flutter/material.dart';

class StudentListPage extends StatelessWidget {
  final List<Map> students;

  const StudentListPage({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alumnos'),
      ),
      body: ListView(
        children: [_createDataTable()],
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _generateColumns(),
      rows: _generateRows(),
      dividerThickness: 4,
      dataRowMaxHeight: 80,
      showBottomBorder: true,
      columnSpacing: 50,
    );
  }

  List<DataColumn> _generateColumns() {
    return [
      DataColumn(
          label: Text(
            'Orden',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          numeric: true),
      DataColumn(
        label: Text(
          'Nombre',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
  }

  List<DataRow> _generateRows() {
    int i = 1;
    return students
        .map((student) => DataRow(cells: [
              DataCell(Text('${i++}')),
              DataCell(Text(student['nombre'])),
            ]))
        .toList();
  }
}
