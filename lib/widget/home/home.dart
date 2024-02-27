import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nospy/widget/task_asigned_widgets/taskasigned.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  String jsondata = '';
  List<Map<String, dynamic>> taskList = [];
  List<Map<String, dynamic>> completedtask = [];

  void taskcompleted(Map<String, dynamic> m) {
    if(m['status']){
    setState(
      () {
        taskList.remove(m);
        completedtask.add(m);
      },
    );
    }
    else{
      setState(
      () {
        taskList.add(m);
        completedtask.remove(m);
      },
    );
    }
  }

  Future getjson() async {
    jsondata = await DefaultAssetBundle.of(context)
        .loadString('assets/data/tasks.json');
    setState(
      () {
        taskList = List<Map<String, dynamic>>.from(
          jsonDecode(jsondata),
        );
      },
    );
  }

  @override
  void initState() {
    getjson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(
          color: Colors.black,
          height: 0.0,
          thickness: 1.0,
        ),
        const Divider(
          color: Colors.black,
          height: 0.0,
          thickness: 1.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Pending Tasks',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child:
                      TaskAsigned(taskList: taskList, complete: taskcompleted),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Completed Tasks',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: TaskAsigned(
                        taskList: completedtask, complete: taskcompleted),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
