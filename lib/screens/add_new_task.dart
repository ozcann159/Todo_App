// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({
    Key? key,
    required this.addNewTask,
  }) : super(
          key: key,
        );
  final void Function(Task newTask) addNewTask;
  // Passing function as parameter

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TodoService todoService = TodoService();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(backgroundColor),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: deviceWidth,
            height: deviceHeight / 10,
            color: const Color(0xff8AAEE0),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  size: 40,
                  color: Color(0xffB1C9EF),
                ),
              ),
              const Expanded(
                  child: Text(
                "Add New Task",
                style: TextStyle(
                    color: Color(0xffD5DEEF),
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ))
            ]),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Task title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 400),
                        content: Text("Category selected"),
                      ),
                    );
                    setState(() {
                      taskType = TaskType.calendar;
                    });
                  },
                  child: Image.asset("assets/images/1.png"),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 400),
                        content: Text("Category selected"),
                      ),
                    );
                    setState(() {
                      taskType = TaskType.contest;
                    });
                  },
                  child: Image.asset("assets/images/2.png"),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 400),
                        content: Text("Category selected"),
                      ),
                    );
                  },
                  child: Image.asset("assets/images/3.png"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "User ID",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: TextField(
                            controller: userIdController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Column(children: [
                    const Text(
                      "Time",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: TextField(
                        controller: timeController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )),
          SizedBox(
            height: 230,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff628ECB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                saveTodo();
                Navigator.pop(context);
              },
              child: const Text("Save"))
        ]),
      ),
    ));
  }

  void saveTodo() {
    Todo newTodo = Todo(
        id: -1,
        todo: titleController.text,
        userId: int.parse(userIdController.text),
        completed: false);

    todoService.addTodo(newTodo);
  }
}
