import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List<String> todo = ["Study Lessons", "Run 5K", "Go to party"];
  //List<String> competed = ["Game meetup", "Take out trash"];

  List<Task> todo = [
    Task(
        title: "Study Lessons",
        description: "Study COMP117",
        isCompleted: false,
        type: TaskType.note),
    Task(
        title: "Go to party",
        description: "Attend to pary",
        isCompleted: false,
        type: TaskType.calendar),
    Task(
        title: "Run 5K",
        description: "Run 5 kilometers",
        isCompleted: false,
        type: TaskType.contest),
  ];

  List<Task> completed = [
    Task(
        title: "Go to party",
        description: "Attend to pary",
        isCompleted: false,
        type: TaskType.calendar),
    Task(
        title: "Run 5K",
        description: "Run 5 kilometers",
        isCompleted: false,
        type: TaskType.contest),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getTodos();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70))),
                width: deviceWidth,
                height: deviceHeight / 5,
                // color: const Color(0xff395886),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(21),
                      child: Text(
                        "October 20, 2024",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Text("My Todo list",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return TodoItem(
                        task: todo[index],
                      );
                    },
                  )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "comptaled",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      return TodoItem(task: completed[index]);
                    },
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                          addNewTask: (newTask) => addNewTask(newTask)),
                    ));
                  },
                  child: const Text("Add New Task"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
