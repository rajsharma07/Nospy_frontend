import 'package:flutter/material.dart';


class MyTask extends StatefulWidget {
  MyTask({required this.m, required this.taskcompleted, super.key});
  Map<String, dynamic> m;
  void Function(Map<String, dynamic>) taskcompleted;
  @override
  State<StatefulWidget> createState() {
    return _MyTask();
  }
}

class _MyTask extends State<MyTask> {
  
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(

      value: widget.m['status'],
      onChanged: (bool? value) {
        setState(() {
          widget.m['status'] = value!;
          widget.taskcompleted(widget.m);

        });
      },
      title: Text(
        widget.m['title'],
      ),
      subtitle: Text(
        widget.m['description'],
      ),
      secondary: Text(widget.m['date']),
    );
  }
}
