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
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '9',
          },
        ]
      },
      {
        'nombre': 'Lautaro Agujero',
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '3',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '10',
          },
          {
            'instancia': 'recuperatorio',
            'numero': '1',
            'nota': '9',
          },
        ]
      },
      {
        'nombre': 'Elias Gomez',
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '2',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '2',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '2',
          }
        ]
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
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '5',
          },
          {
            'instancia': 'recuperatorio',
            'numero': '1',
            'nota': '',
          },
          {
            'instancia': 'recuperatorio',
            'numero': '2',
            'nota': '',
          },
          {
            'instancia': 'recuperatorio',
            'numero': '3',
            'nota': '9',
          }
        ]
      },
      {
        'nombre': 'Juan Perez',
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '10',
          }
        ]
      },
      {
        'nombre': 'Maria Rodriguez',
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '10',
          }
        ]
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
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '10',
          }
        ]
      },
      {
        'nombre': 'Ana Fernandez',
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '10',
          }
        ]
      },
      {
        'nombre': 'Sofia Garcia',
        'notas': [
          {
            'instancia': 'parcial',
            'numero': '1',
            'nota': '8',
          },
          {
            'instancia': 'parcial',
            'numero': '2',
            'nota': '9',
          },
          {
            'instancia': 'parcial',
            'numero': '3',
            'nota': '10',
          }
        ]
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FittedBox(
                              child: Text(
                                'Aula ${_titles[index]['aula']}',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              child: Text(
                                _titles[index]['horario'],
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          flex: 1,
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
