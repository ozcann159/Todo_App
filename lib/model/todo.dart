// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  // From json
  Todo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userId = json["userId"];
  }

  //To json

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userId"] = userId;

    return data;
  }

  Todo({
    required this.id,
    required this.todo,
    this.completed,
    required this.userId,
  });
}
