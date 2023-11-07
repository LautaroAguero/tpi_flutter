import 'package:flutter/material.dart';

class StudentsPerDebtPage extends StatefulWidget {
  const StudentsPerDebtPage({Key? key}) : super(key: key);

  @override
  State<StudentsPerDebtPage> createState() => _AllStudentsPageState();
}

class _AllStudentsPageState extends State<StudentsPerDebtPage> {
  final List<Map<String, dynamic>> students = [
    {'nombre': 'Lucia Fernandez', 'legajo': '875236', 'monto': '5000'},
    {'nombre': 'Juan Perez', 'legajo': '145768', 'monto': '2500'},
    {'nombre': 'Maria Rodriguez', 'legajo': '427584', 'monto': '1000'},
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
        title: const Text('Alumnos con deuda'),
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
      DataColumn(label: Text('Monto')),
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
        DataCell(Text(student['monto']))
      ];
      return DataRow(cells: cells);
    }).toList();
  }
}
