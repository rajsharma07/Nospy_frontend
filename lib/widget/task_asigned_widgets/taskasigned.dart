import 'package:flutter/material.dart';
import 'package:nospy/widget/task_asigned_widgets/mytask.dart';

class TaskAsigned extends StatefulWidget {
  TaskAsigned({required this.taskList, required this.complete, super.key});
  List<Map<String, dynamic>> taskList = [];
  void Function(Map<String, dynamic>) complete;
  @override
  State<TaskAsigned> createState() {
    return _TaskAsigned();
  }
}

class _TaskAsigned extends State<TaskAsigned> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.taskList
          .map(
            (e) => MyTask(m: e, taskcompleted: widget.complete),
          )
          .toList(),
    );
  }
}
