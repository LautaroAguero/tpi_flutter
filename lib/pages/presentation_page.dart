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
          Text(
            'Bienvenido de vuelta ${user.name}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            child: ClipOval(
              child: SvgPicture.asset(
                'assets/brandIcon.svg',
                semanticsLabel: 'Educar Logo',
              ),
            ),
          )
        ]),
      ),
    );
  }
}
