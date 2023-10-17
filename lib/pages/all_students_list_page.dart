import 'package:flutter/material.dart';

class AllStudentsPage extends StatefulWidget {
  const AllStudentsPage({Key? key}) : super(key: key);

  @override
  State<AllStudentsPage> createState() => _AllStudentsPageState();
}

class _AllStudentsPageState extends State<AllStudentsPage> {
  final List<Map<String, dynamic>> students = [
    {
      'nombre': 'Matias Virgona',
      'legajo': '123456',
    },
    {
      'nombre': 'Lautaro Agujero',
      'legajo': '458216',
    },
    {
      'nombre': 'Elias Gomez',
      'legajo': '258613',
    },
    {'nombre': 'Lucia Fernandez', 'legajo': '875236'},
    {'nombre': 'Juan Perez', 'legajo': '145768'},
    {'nombre': 'Maria Rodriguez', 'legajo': '427584'},
    {
      'nombre': 'Pedro Martinez',
      'legajo': '578425',
    },
    {
      'nombre': 'Ana Fernandez',
      'legajo': '857412',
    },
    {
      'nombre': 'Sofia Garcia',
      'legajo': '789652',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: const Text('Lista de Estudiantes'),
      ),
      body: ListView(
        children: [
          Row(children: []),
          _createDataTable(),
          SizedBox(
            height: 10,
          ),
        ],
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
    List<DataColumn> columns = [
      DataColumn(label: Text('N°')),
      DataColumn(label: Text('Nombre')),
      DataColumn(label: Text('Legajo')),
    ];
    return columns;
  }

  List<DataRow> _generateRows() {
    int order = 1;
    return students.asMap().entries.map((entry) {
      Map<String, dynamic> student = entry.value;
      List<DataCell> cells = [
        DataCell(Text('${order++}')),
        DataCell(Text(student['nombre'])),
        DataCell(Text(student['legajo'])),
      ];
      return DataRow(cells: cells);
    }).toList();
  }
}
