import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/archive_tasks/archiveTasks.dart';
import 'package:flutter_learn/modules/done_tasks/DoneTasks.dart';
import 'package:flutter_learn/modules/new_tasks/NewTasks.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;
  List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    archiveTasks()
  ];

  List<String> names = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          names[currentIndex],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline_outlined), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined), label: 'Archive'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
