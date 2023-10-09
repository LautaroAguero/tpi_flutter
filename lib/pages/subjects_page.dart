import 'package:flutter/material.dart';

final List<String> _titles = [
  'Analisis Matematico',
  'Algebra y Geometria Analitica',
  'Algoritmos y Estructuras de Datos',
  'Metodologia de Sistemas',
];

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _titles.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Card(
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _titles[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Aula 101',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '8:00 - 10:00',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
        );
      },
    );
  }
}
