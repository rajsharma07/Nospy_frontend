import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nospy/widget/dashboard/dashboard_team_display.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() {
    return _DashBoard();
  }
}

class _DashBoard extends State<DashBoard> {
  List teamsdata = [];
  Future jsonconverting() async {
    String jsonstring =
        await DefaultAssetBundle.of(context).loadString("assets/data/teams.json");
    dynamic jsondata = jsonDecode(jsonstring);
    setState(() {
      teamsdata = jsondata;
    });
  }

  @override
  void initState() {
    jsonconverting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          title: Text("Teams"),
        ),
        teamsdata.isNotEmpty
            ? SingleChildScrollView(
              child: Column(children: teamsdata.map(
                  (e) => TeamDashboardDisplay(e, e['member']),
                ).toList()),
            )
              : const Text("no data")
      ],
    );
  }
}
