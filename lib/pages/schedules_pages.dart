import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tpi_flutter/models/subject.dart';
import 'package:tpi_flutter/models/user.dart';
import 'package:http/http.dart' as http;

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
  final User user;

  const SchedulesPage({required this.user});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  Future<List?> getSchedules() async {
    final response = await http.get(Uri.parse(
        'https://tpi-metodologia-grupo-3-2023.onrender.com/subjects/students/${widget.user.id}'));
    if (response.statusCode == 200) {
      List<dynamic> schedules = [];
      List<dynamic> jsonResponse = jsonDecode(response.body);
      for (var schedule in jsonResponse) {
        schedules.add(Subject.fromJson(schedule));
      }
      return schedules;
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
        future: getSchedules(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.data.length == 0) {
              return Center(
                child: Text('No hay materias asignadas',
                    style: TextStyle(
                      fontSize: 20.0, // Cambia esto al tamaño que desees
                    )),
              );
            }
            return Scaffold(
              backgroundColor:
                  Theme.of(context).colorScheme.background.withOpacity(0.1),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.picture_as_pdf),
              ),
              body: ListView.builder(
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
                                      'Aula ${snapshot.data[index].classroom}',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      snapshot.data[index].schedule,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 0,
                                    child: Text(
                                      snapshot.data[index].professor.name,
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
              ),
            );
          }
        });
  }
}
