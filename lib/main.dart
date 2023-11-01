import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpi_flutter/models/user.dart';
import 'package:tpi_flutter/pages/grades_page.dart';
import 'package:tpi_flutter/pages/login_page.dart';
import 'package:tpi_flutter/pages/managment_page.dart';
import 'package:tpi_flutter/pages/payment_page.dart';
import 'package:tpi_flutter/pages/presentation_page.dart';
import 'package:tpi_flutter/pages/schedules_pages.dart';
import 'package:tpi_flutter/pages/subjects_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'EducarApp',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0x00234262)),
        ),
        home: LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  final User user;

  const MyHomePage({required this.user});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = PresentationPage(user: widget.user);
        break;
      case 1:
        page = PaymentPage();
        break;
      case 2:
        page = SchedulesPage();
        break;
      case 3:
        page = GradesPage();
        break;
      case 4:
        page = SubjectPage();
        break;
      case 5:
        page = ManagementPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(child: constructView(constraints)),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }

  NavigationRail constructView(constraints) {
    NavigationRail sideNav;
    switch (widget.user.role) {
      case 'Estudiante':
      case 'Padre':
        List<int> visibleDestination = [0, 1, 2, 3];
        selectedIndex = visibleDestination[0];
        sideNav = NavigationRail(
          minExtendedWidth: 180,
          extended: constraints.maxWidth >= 800,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.payment),
              label: Text('Pagos'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.book_outlined),
              label: Text('Horarios'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.grade_outlined),
              label: Text('Notas'),
            )
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            print('selected: $value');
            print('visible selected: ${visibleDestination[value]}');
            setState(() {
              selectedIndex = visibleDestination[value];
            });
          },
        );
        break;
      case 'Profesor':
        List<int> visibleDestination = [0, 1, 4];
        selectedIndex = visibleDestination[0];
        sideNav = NavigationRail(
          minExtendedWidth: 180,
          extended: constraints.maxWidth >= 800,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.payment),
              label: Text('Pagos'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.subject_outlined),
              label: Text('Materias'),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            print('selected: $value');
            setState(() {
              selectedIndex = visibleDestination[value];
            });
          },
        );
        break;
      case 'Personal':
        List<int> visibleDestination = [0, 1, 5];
        selectedIndex = visibleDestination[0];
        sideNav = NavigationRail(
          minExtendedWidth: 180,
          extended: constraints.maxWidth >= 800,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.payment),
              label: Text('Pagos'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.manage_accounts_outlined),
              label: Text('Gestion'),
            )
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            print('selected: $value');
            print('visible selected: ${visibleDestination[value]}');
            setState(() {
              selectedIndex = visibleDestination[value];
            });
          },
        );
        break;
      case 'Autoridad':
        List<int> visibleDestination = [0, 1, 2, 3, 4, 5];
        sideNav = NavigationRail(
          minExtendedWidth: 180,
          extended: constraints.maxWidth >= 800,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.payment),
              label: Text('Pagos'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.book_outlined),
              label: Text('Horarios'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.grade_outlined),
              label: Text('Notas'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.subject_outlined),
              label: Text('Materias'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.manage_accounts_outlined),
              label: Text('Gestion'),
            ),
          ],
          selectedIndex: visibleDestination[selectedIndex],
          onDestinationSelected: (value) {
            print('selected: $value');
            print('visible selected: ${visibleDestination[value]}');
            setState(() {
              selectedIndex = visibleDestination[value];
            });
          },
        );
        break;

      default:
        List<int> visibleDestination = [0];
        selectedIndex = visibleDestination[0];
        sideNav = sideNav = NavigationRail(
          minExtendedWidth: 180,
          extended: constraints.maxWidth >= 800,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              label: Text('Home'),
            )
          ],
          selectedIndex: visibleDestination[selectedIndex],
          onDestinationSelected: (value) {
            print('selected: $value');
            print('visible selected: ${visibleDestination[value]}');
            setState(() {
              selectedIndex = visibleDestination[value];
            });
          },
        );
        break;
    }

    return sideNav;
  }
}
