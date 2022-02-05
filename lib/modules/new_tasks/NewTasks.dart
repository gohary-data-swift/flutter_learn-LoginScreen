import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/shard/components/components.dart';
import 'package:flutter_learn/shard/components/constants.dart';

class NewTasks extends StatelessWidget {

  @required String name = 'New Tasks';

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (
            context, index
        ) => tasksBuild(
          myTaskes[index]
        ), separatorBuilder: (
        context, index
    ) => Container(
      width: double.infinity,
      height: 1.5,
      color: Colors.grey[300],
    ), itemCount: myTaskes.length
    );
  }
}
