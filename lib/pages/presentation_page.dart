import 'package:flutter/material.dart';
import 'package:tpi_flutter/models/user.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PresentationPage extends StatelessWidget {
  final User user;

  const PresentationPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido de vuelta ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text('${user.name}',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            child: ClipOval(
              child: SvgPicture.asset(
                'assets/brandIcon.svg',
                semanticsLabel: 'Educar Logo',
                fit: BoxFit.cover,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
