import 'package:flutter/material.dart';

final List<String> _titles = [
  'Analisis Matematico',
  'Algebra y Geometria Analitica',
  'Algoritmos y Estructuras de Datos',
  'Metodologia de Sistemas',
  'Sistema de Procesamiento de Datos',
  'Diseño de Bases de Datos',
];

final Map<String, int> _grades = {
  'Parcial 1': 8,
  'Parcial 2': 3,
  'Parcial 3': 10,
  'Recuperatorio 2': 7,
  'Trabajo Practico Integrador': 8,
  'Trabajos Practicos': 9,
};

class GradesPage extends StatelessWidget {
  const GradesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _titles.length,
      itemBuilder: (context, index) {
        String abbreviation = _getAbbreviation(_titles[index]);
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              _titles[index],
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
                  builder: (context) => SecondPage(heroTag: index)))
            },
          ),
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;
  const SecondPage({required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[heroTag])),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Hero(
                tag: heroTag,
                child: CircleAvatar(
                  child: Text(_getAbbreviation(_titles[heroTag])),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _grades.length,
              itemBuilder: (context, index) {
                String key = _grades.keys.elementAt(index);
                int value = _grades.values.elementAt(index);
                return Card(
                  child: ListTile(
                    title: Text(
                      key,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
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
