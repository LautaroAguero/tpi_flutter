import 'package:flutter/material.dart';

class GradesValuesPage extends StatelessWidget {
  final String heroTag;
  final List<Map> grades;
  const GradesValuesPage({required this.heroTag, required this.grades});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(title: Text(heroTag)),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Hero(
                tag: heroTag,
                child: CircleAvatar(
                  child: Text(_getAbbreviation(heroTag)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: grades.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      '${grades[index]['instancia']} ${grades[index]['numero']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: Text(
                      '${grades[index]['nota']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

String _getAbbreviation(String title) {
  List<String> words = title.split(' ');
  List<String> abbreviations = words
      .where((word) => word.contains(RegExp('[A-Z]')))
      .map((word) => word.replaceAll(RegExp('[^A-Z]'), ''))
      .toList();
  return abbreviations.join('');
}
