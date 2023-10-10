import 'package:flutter/material.dart';
import 'package:tpi_flutter/pages/student_list_page.dart';

final List<Map> _titles = [
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

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key}) : super(key: key);

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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentListPage(
                                        students: _titles[index]
                                            ['estudiantes'])),
                              );
                            },
                            child: Text(
                              'Lista de Alumnos',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
