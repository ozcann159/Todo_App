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

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff8AAEE0),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70))),
                width: deviceWidth,
                height: deviceHeight / 5,
                //color: const Color(0xff395886),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(21),
                      child: Text(
                        "October 20, 2024",
                        style: TextStyle(
                            color: Color(0xffD5DEEF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Text("My Todo list",
                          style: TextStyle(
                              color: Color(0xffF0F3FA),
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
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        if (snapshot.data == null) {
                          return const CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return TodoItem(
                                task: snapshot.data![index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: FutureBuilder(
                      future: todoService.getUncompletedTodos(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const Center(
                              child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          ));
                        } else {
                          return FutureBuilder(
                            future: todoService.getCompletedTodos(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Center(
                                    child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(),
                                ));
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return TodoItem(
                                        task: snapshot.data![index]);
                                  },
                                );
                              }
                            },
                          );
                        }
                      },
                    )),
              ),
              //395886
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff628ECB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTaskScreen(
                        addNewTask: (newTask) => addNewTask(newTask),
                      ),
                    ));
                  },
                  child: const Text("Add New Task"),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
