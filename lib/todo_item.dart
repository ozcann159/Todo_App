// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    Key? key,
    required this.task,
  }) : super(
          key: key,
        );
  final Todo task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /**TODO: Firebase işlemleri
             * widget.task.type == TaskType.note
                ? Image.asset("assets/images/3.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("assets/images/2.png")
                    : Image.asset("assets/images/1.png"),
             */

            Expanded(
              child: Column(children: [
                Text(
                  widget.task.todo!,
                  style: TextStyle(
                      decoration: widget.task.completed!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "User${widget.task.userId!}",
                  style: TextStyle(
                      decoration: widget.task.completed!
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
                    widget.task.completed = !widget.task.completed!;
                    isChecked = val!; // val değişkeni varsa işleme koy
                  });
                }),
          ],
        ),
      ),
    );
  }
}
