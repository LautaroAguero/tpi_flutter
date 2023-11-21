import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tpi_flutter/models/subject.dart';
import 'package:tpi_flutter/models/user.dart';
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

class SubjectPage extends StatefulWidget {
  final User user;

  const SubjectPage({required this.user});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  Future<List?> getSubjects() async {
    final response = await http.get(
        Uri.parse(
            'https://tpi-metodologia-grupo-3-2023.onrender.com/teacher/${widget.user.id}/students'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      List<Subject> subjects = [];
      List<dynamic> jsonResponse = jsonDecode(response.body);
      for (var subject in jsonResponse) {
        subjects.add(Subject.fromJson(subject));
      }
      return subjects;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: [
              Icon(
                size: 40,
                Icons.warning,
                color: Colors.redAccent,
              ),
              SizedBox(width: 20),
              Text('Error traer las materias'),
            ],
          ),
          // ignore: use_build_context_synchronously
          backgroundColor: Theme.of(context).colorScheme.error));
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSubjects(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error {$snapshot.error}');
          } else {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('No hay materias asignadas',
                    style: TextStyle(
                      fontSize: 20.0, // Cambia esto al tamaño que desees
                    )),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
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
                                snapshot.data[index].name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          'Aula ${snapshot.data[index].classroom}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      FittedBox(
                                        child: Text(
                                          snapshot.data[index].schedule,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StudentListPage(
                                                      students: _titles[index]
                                                          ['estudiantes'])),
                                        );
                                      },
                                      child: Text(
                                        'Lista de Alumnos',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
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
        });
  }
}
