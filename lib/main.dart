import 'package:flutter/material.dart';
import 'package:todo_app/task_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskData> tasks = [
      TaskData(title: 'test', date: DateTime.now()),
      TaskData(title: 'test1', date: DateTime.now()),
      TaskData(title: 'test2', date: DateTime.now()),
      TaskData(title: 'test3', date: DateTime.now()),
      TaskData(title: 'test4', date: DateTime.now()),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xFFE6E6E6),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text("To Do App"),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: Container(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ...tasks.map((e) => TaskAdd(title: e.title, date: e.date)).toList(),
                const Spacer(),
                const SizedBox(
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'To add a Task Lorem...',
                          ),
                        ),
                      ),
                      Icon(Icons.add_circle_outline_sharp)
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class TaskAdd extends StatelessWidget {
  final String title;
  final DateTime date;
  const TaskAdd({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.check_box_outline_blank_rounded),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.green,
                        thickness: 1,
                        indent: 5,
                        endIndent: 10,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(Icons.remove_circle_outline_rounded),
                

              ],
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
