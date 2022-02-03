import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/modules/archive_tasks/archiveTasks.dart';
import 'package:flutter_learn/modules/done_tasks/DoneTasks.dart';
import 'package:flutter_learn/modules/new_tasks/NewTasks.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [NewTasks(), DoneTasks(), archiveTasks()];

  List<String> names = ['New Tasks', 'Done Tasks', 'Archive Tasks'];

  late Database database;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var fialdkey = GlobalKey<FormState>();
  bool isBottonSheet = false;
  IconData flotingIcon = Icons.edit;
  var taskController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(
          names[currentIndex],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottonSheet == true) {
            if (fialdkey.currentState!.validate()) {
             insertToDatabase(
                 taskController.text,
                 timeController.text,
                 dateController.text
             );
              Navigator.pop(context);
              isBottonSheet = false;
              setState(() {
                flotingIcon = Icons.edit;
              });
            }
            ;
          } else {
            scaffoldkey.currentState?.showBottomSheet((context) => Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: fialdkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                            controller: taskController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (String value) {},
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.title),
                                labelText: 'Task title',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Task field is required';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                print(value?.format(context).toString());
                                timeController.text =
                                    value!.format(context).toString();
                              });
                            },
                            controller: timeController,
                            keyboardType: TextInputType.datetime,
                            onChanged: (String value) {},
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.watch_later),
                                labelText: 'Task date',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Time field is required';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: new DateTime.now(),
                                  firstDate: new DateTime(2016),
                                  lastDate: new DateTime(2030));
                              if (picked != null)
                                setState(() => dateController.text =
                                    DateFormat.yMMMd().format(picked));
                            },
                            controller: dateController,
                            keyboardType: TextInputType.datetime,
                            onChanged: (String value) {},
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
                                labelText: 'Task date',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Date field is required';
                              }
                              return null;
                            })
                      ],
                    ),
                  ),
                ));
            isBottonSheet = true;
            setState(() {
              flotingIcon = Icons.add;
            });
          }
          // insertToDatabase();
        },
        child: Icon(flotingIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline_outlined), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archive'),
        ],
      ),
      body: screens[currentIndex],
    );
  }

  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
      print('Database created');
      await database.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)');
    }, onOpen: (database) {
      print('Database opend');
    });
  }

  Future insertToDatabase(
    @required String  title,
    @required String time,
    @required String date,
  ) async {
    return await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO Test(title, date, time, status) VALUES("$title", "$date", "$time", "New")')
          .then((value) {
        print('$value insert successfuly');
      }).catchError((error) {
        print('Error then insert new task ${error.toString()}');
      });
      return null;
    });
  }
}
