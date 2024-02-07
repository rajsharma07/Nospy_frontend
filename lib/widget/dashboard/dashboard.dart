
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nospy/widget/dashboard/dashboard_team_display.dart';

class DashBoard extends StatefulWidget{
  DashBoard({super.key});
  @override
  State<DashBoard> createState(){
    return _DashBoard();
  }
}

class _DashBoard extends State<DashBoard>{

  List teamsdata = [];
  Future jsonconverting() async{
      String jsonstring = await DefaultAssetBundle.of(context).loadString("lib/data/teams.json");
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
  Widget build(BuildContext context){
    print(teamsdata);
    return ListView(
      children: [
        const ListTile(
          title: Text("Teams"),
        ),
      teamsdata.isNotEmpty? TeamDashboardDisplay(teamsdata[0], teamsdata[0]['member']):const Text("no data")
      ],
    );
  }
}