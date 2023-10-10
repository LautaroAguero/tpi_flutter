import 'package:flutter/material.dart';

final List<Map> _titles = [
  {
    'nombre': 'Analisis Matematico',
    'aula': '101',
    'horario': '8:00 - 10:00',
    'profesor': 'Juan Perez',
  },
  {
    'nombre': 'Algebra y Geometria Analitica',
    'aula': '102',
    'horario': '10:00 - 12:00',
    'profesor': 'Maria Rodriguez',
  },
  {
    'nombre': 'Algoritmos y Estructuras de Datos',
    'aula': '103',
    'horario': '14:00 - 16:00',
    'profesor': 'Pedro Martinez',
  },
  {
    'nombre': 'Metodologia de Sistemas',
    'aula': '104',
    'horario': '16:00 - 18:00',
    'profesor': 'Ana Fernandez',
  },
];

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({Key? key}) : super(key: key);

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _titles.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _titles[index]['nombre'],
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
                            'Aula ${_titles[index]['aula']}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            _titles[index]['horario'],
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          child: Text(
                            _titles[index]['profesor'],
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
          ),
        );
      },
    );
  }
}
