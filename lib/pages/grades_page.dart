import 'package:flutter/material.dart';
import 'package:tpi_flutter/pages/grades_values_page.dart';

final List<Map> _titles = [
  {
    'materia': 'Analisis Matematico',
    'notas': [
      {
        'instancia': 'parcial 1',
        'nota': '8',
      },
      {
        'instancia': 'parcial 2',
        'nota': '9',
      },
      {
        'instancia': 'parcial 3',
        'nota': '10',
      }
    ]
  },
  {
    'materia': 'Algebra y Geometria Analitica',
    'notas': [
      {
        'instancia': 'parcial 1',
        'nota': '8',
      },
      {
        'instancia': 'parcial 2',
        'nota': '9',
      },
      {
        'instancia': 'parcial 3',
        'nota': '10',
      }
    ]
  },
  {
    'materia': 'Analisis Matematico',
    'notas': [
      {
        'instancia': 'parcial 1',
        'nota': '8',
      },
      {
        'instancia': 'parcial 2',
        'nota': '9',
      },
      {
        'instancia': 'parcial 3',
        'nota': '10',
      }
    ]
  }
];

class GradesPage extends StatelessWidget {
  const GradesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _titles.length,
      itemBuilder: (context, index) {
        String abbreviation = _getAbbreviation(_titles[index]['materia']);
        return Card(
          elevation: 3,
          child: ListTile(
            tileColor: Colors.white,
            minVerticalPadding: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text(
              _titles[index]['materia'],
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Hero(
              tag: index,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: CircleAvatar(
                      child: Text(
                    abbreviation,
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
                ),
              ),
            ),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(
                        heroTag: _titles[index]['materia'],
                        grades: _titles[index]['notas'],
                      )))
            },
          ),
        );
      },
    );
  }
}

String _getAbbreviation(String title) {
  List<String> words = title.split(' ');
  List<String> abbreviations = words
      .where((word) => word.contains(RegExp('[A-Z]')))
      .map((word) => word.replaceAll(RegExp('[^A-Z]'), ''))
      .toList();
  return abbreviations.join('');
}
