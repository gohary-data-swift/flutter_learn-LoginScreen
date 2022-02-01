import 'package:flutter/cupertino.dart';

class archiveTasks extends StatelessWidget {
  const archiveTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Archive Tasks',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
