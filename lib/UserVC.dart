import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userModel {
  final int id;
  final String name;
  final String phone;

  userModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}

class UserVC extends StatelessWidget {
//  const UserVC({Key? key}) : super(key: key);

  List<userModel> users = [
    userModel(id: 1, name: 'ahmed elgohary', phone: '201026668121'),
    userModel(id: 2, name: 'mostafa elgohary', phone: '201026668678'),
    userModel(id: 3, name: 'mohamed elgohary', phone: '201028868121'),
    userModel(id: 1, name: 'ahmed elgohary', phone: '201026668121'),
    userModel(id: 2, name: 'mostafa elgohary', phone: '201026668678'),
    userModel(id: 3, name: 'mohamed elgohary', phone: '201028868121'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('User'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(userModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              child: Text(
                '${user.id}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
