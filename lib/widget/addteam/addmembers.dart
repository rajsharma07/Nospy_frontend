import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nospy/model/member.dart';
import 'package:nospy/widget/addteam/membertile.dart';

class AddMembers extends StatefulWidget {
  const AddMembers({super.key});
  @override
  State<AddMembers> createState() {
    return _AddMembers();
  }
}

class _AddMembers extends State<AddMembers> {
  var memberidcontrol = TextEditingController();
  List<Member> m = [
    Member(name: 'Nehal', id: '123', dsg: Designation.Member, teamid: 'asd', profile: "assets/Image/jhatu.jpg"),
    Member(name: 'Piyush', id: '123', dsg: Designation.Member, teamid: 'asd', profile: "assets/Image/jhatu.jpg"),
    Member(name: 'Siddhesh', id: '123', dsg: Designation.Member, teamid: 'asd', profile: "assets/Image/jhatu.jpg"),
    Member(name: 'Atharv', id: '123', dsg: Designation.Member, teamid: 'asd', profile: "assets/Image/jhatu.jpg"),
    Member(name: 'Raj', id: '123', dsg: Designation.Member, teamid: 'asd', profile: "assets/Image/jhatu.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                child: TextField(

                  decoration: InputDecoration(
                    hintText: 'Add Members',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          const SizedBox(height: 30,),
          m.isNotEmpty?
          Column(
            children: m.map((e){
              return MemberTile(member: e);
            }).toList(),
          ):const Text('No member added')
        ],
      ),
    );
  }
}
