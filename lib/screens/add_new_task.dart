// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

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
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TaskType taskType = TaskType.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                color: const Color(0xff395886),
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
                  padding: EdgeInsets.only(top: 20), child: Text("Task title")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  controller: titleController,
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Category"),
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
                          const Text("Date"),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: dateController,
                                decoration: InputDecoration(
                                    filled: true, fillColor: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(children: [
                        Text("Time"),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: timeController,
                            decoration: InputDecoration(
                                filled: true, fillColor: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("Description")),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Task newTask = Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        isCompleted: false,
                        type: taskType);
                    widget.addNewTask(newTask);
                    Navigator.pop(context);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
