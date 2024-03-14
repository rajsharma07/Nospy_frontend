import 'dart:convert';

import 'package:flutter/material.dart';

class GroupChats extends StatefulWidget {
  GroupChats({super.key, required this.send});
  final Function() send;
  @override
  State<GroupChats> createState() {
    return _GroupChat();
  }
}

class _GroupChat extends State<GroupChats> {
  List teams = [];
  void jsondecoding() async {
    String datastr = await DefaultAssetBundle.of(context)
        .loadString('assets/data/teams.json');
    var datadecoded = jsonDecode(datastr);
    setState(() {
      teams = datadecoded;
    });
    return;
  }

  @override
  void initState() {
    jsondecoding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return teams.isEmpty
        ? const Center(
            child: Text('No chats available11'),
          )
        : ListView.builder(
            itemCount: teams.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: widget.send,
                contentPadding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                leading: const Icon(Icons.group),
                title: Row(
                  children: [
                    Text(teams[index]['name']),
                    const Spacer(),
                    const Badge(
                      backgroundColor: Colors.redAccent,
                      label: Text('3'),
                    )
                  ],
                ),
              );
            },
          );
  }
}
