import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({Key? key, required this.title}) : super(key: key,);
 final String title ;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.notes_outlined,
              size: 45,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Checkbox(
                activeColor: const Color(0xff638ECB),
                value: isChecked,
                onChanged: (val) {
                  setState(() {
                    isChecked = val!; // val değişkeni varsa işleme koy
                  });
                }),
          ],
        ),
      ),
    );
  }
}
