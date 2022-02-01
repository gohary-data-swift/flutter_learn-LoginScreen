import 'package:flutter/cupertino.dart';

class NewTasks extends StatelessWidget {

  @required String name = 'New Tasks';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
