import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  final List<Map> students;

  const StudentListPage({super.key, required this.students});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  bool? _isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alumnos'),
      ),
      body: ListView(
        children: [
          _createDataTable(),
          SizedBox(
            height: 10,
          ),
          _createCheckboxField()
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
      DataColumn(label: Text('Nombre'))
    ];

    if (widget.students.isNotEmpty) {
      List<Map> grades = getLongestNotes(widget.students);

      for (var grade in grades) {
        columns.add(DataColumn(
            label: Text('${grade['instancia']} ${grade['numero']}')));
      }
    }
    return columns;
  }

  List<DataRow> _generateRows() {
    int order = 1;
    return widget.students.map((student) {
      List<DataCell> cells = [
        DataCell(Text('${order++}')),
        DataCell(Text(student['nombre'])),
      ];
      for (var nota in student['notas']) {
        cells.add(_createNoteCell(nota['nota']));
      }
      while (cells.length < _generateColumns().length) {
        cells.add(_createNoteCell(Text(' ').data));
      }
      return DataRow(cells: cells);
    }).toList();
  }

  DataCell _createNoteCell(note) {
    TextEditingController controller = TextEditingController(text: note);
    return DataCell(_isEditMode == true
        ? TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              setState(() {
                note = value;
                controller.text = value;
              });
            },
          )
        : Text(note));
  }

  Row _createCheckboxField() {
    return Row(
      children: [
        Checkbox(
          value: _isEditMode,
          onChanged: (value) => {
            setState(
              () => _isEditMode = value,
            )
          },
        ),
        Text('Edit Mode')
      ],
    );
  }
}

List<Map> getLongestNotes(List<Map> list) {
  List<Map> longestNotes = [];
  if (list.isNotEmpty) {
    longestNotes = list[0]['notas'];
    for (var student in list) {
      int length = student['notas'].length;
      if (length > longestNotes.length) {
        longestNotes = student['notas'];
      }
    }
  }
  return longestNotes;
}
