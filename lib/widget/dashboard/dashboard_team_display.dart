import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TeamDashboardDisplay extends StatelessWidget {
  TeamDashboardDisplay(this.teamdata, this.member, {super.key});
  Map<String, dynamic> teamdata;
  List member;
  @override
  Widget build(BuildContext context) {
    member = teamdata['member'];
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                teamdata['name'],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...member.map(
              (e) {
                return CircleAvatar(
                  backgroundImage: AssetImage(e),
                  maxRadius: 20,
                );
              },
            )
          ],
        )
      ],
    );
  }
}
