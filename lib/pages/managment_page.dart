import 'package:flutter/material.dart';

import 'package:tpi_flutter/pages/all_students_list_page.dart';
import 'package:tpi_flutter/pages/students_per_debt_page.dart';
import 'package:tpi_flutter/pages/students_per_subject_page.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(0.1),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Modulo de Gestion',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  radius: 100,
                  child: Icon(
                    Icons.manage_accounts_outlined,
                    size: 100,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.inversePrimary,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllStudentsPage()));
                        },
                        child: Text(
                          'Listar Estudiantes',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 3,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.inversePrimary,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StudentsPerSubjectPage()));
                        },
                        child: Text(
                          'Alumnos por Materia',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 3,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.inversePrimary,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentsPerDebtPage()),
                          );
                        },
                        child: Text(
                          'Alumnos Impagos',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 3,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                        ),
                        onPressed: null,
                        child: Text(
                          'Nuevo Estudiante',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 3,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
