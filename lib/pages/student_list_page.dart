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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: const Text('Lista de Alumnos'),
      ),
      body: ListView(
        children: [
          Row(children: [
            _createEditButton(),
            SizedBox(width: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 20),
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primary, // set the background color here
                foregroundColor: Colors.white, // set the text color here
              ),
              onPressed: () {
                _submitForm(context);
              },
              child: Text('Enviar'),
            )
          ]),
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
    return widget.students.asMap().entries.map((entry) {
      int studentIndex = entry.key;
      Map student = entry.value;
      List<DataCell> cells = [
        DataCell(Text('${order++}')),
        DataCell(Text(student['nombre'])),
      ];
      for (var noteIndex = 0;
          noteIndex < student['notas'].length;
          noteIndex++) {
        cells.add(_createNoteCell(
          student['notas'][noteIndex]['nota'],
          studentIndex,
          noteIndex,
        ));
      }
      while (cells.length < _generateColumns().length) {
        cells.add(_createNoteCell(Text('').data, studentIndex, 0));
      }
      return DataRow(cells: cells);
    }).toList();
  }

  DataCell _createNoteCell(note, int studentIndex, int noteIndex) {
    TextEditingController controller = TextEditingController(text: note);
    return DataCell(_isEditMode == true
        ? TextFormField(
            controller: controller,
            onFieldSubmitted: (value) {
              setState(() {
                widget.students[studentIndex]['notas'][noteIndex]['nota'] =
                    value;
                controller.text = value;
              });
            },
          )
        : Text(note));
  }

  Row _createEditButton() {
    return Row(
      children: [
        SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 30,
          child: IconButton(
            icon: Icon(Icons.edit),
            iconSize: 30,
            onPressed: () {
              setState(() {
                if (_isEditMode != null && _isEditMode == true) {
                  _isEditMode = false;
                } else {
                  _isEditMode = true;
                }
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Modificar Notas', style: TextStyle(fontSize: 15))
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

_submitForm(BuildContext context) async {
  await Future.delayed(Duration(seconds: 1));
  // ignore: use_build_context_synchronously
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Notas editadas correctamente'),
    backgroundColor: Colors.green,
  ));
}
