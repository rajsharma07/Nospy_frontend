import 'package:flutter/material.dart';

class TeamDashboardDisplay extends StatelessWidget {
  TeamDashboardDisplay(this.teamdata, this.member, {super.key});
  Map<String, dynamic> teamdata;
  List member;
  @override
  Widget build(BuildContext context) {
    member = teamdata['member'];
    return Card(  
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        teamdata['name'],
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
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
              ),
            ),
            Text(
              teamdata['discription'],
            )
          ],
        ),
      ),
    );
  }
}
