import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
  required Color background,
  bool isUpperCase = true,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: Colors.white),
          )),
    );

Widget tasksBuild(Map model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text(
              '${model['time']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${model['date']}',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
