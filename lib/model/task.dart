// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/constants/tasktype.dart';

class Task {
  late String title;
  late String description;
  late bool isCompleted;
  late TaskType type;
  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.type,
  });
}
