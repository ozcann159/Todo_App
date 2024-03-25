// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    Key? key,
    required this.task,
  }) : super(
          key: key,
        );
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == TaskType.note
                ? Image.asset("assets/images/3.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("assets/images/2.png")
                    : Image.asset("assets/images/1.png"),
            Expanded(
              child: Column(children: [
                Text(
                  widget.task.title,
                  style: TextStyle(
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.task.description,
                  style: TextStyle(
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                )
              ]),
            ),
            Checkbox(
                activeColor: const Color(0xff638ECB),
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!; // val değişkeni varsa işleme koy
                  });
                }),
          ],
        ),
      ),
    );
  }
}
