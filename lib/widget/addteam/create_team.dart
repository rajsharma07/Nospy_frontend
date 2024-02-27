import 'package:flutter/material.dart';
import 'package:nospy/widget/addteam/addmembers.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({super.key});

  @override
  State<CreateTeam> createState() {
    return _CreateTeam();
  }
}

class _CreateTeam extends State<CreateTeam> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Name Your Team'),
          const TextField(),
          const SizedBox(
            height: 40,
          ),
          const Text('Description:'),
          const TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text('Add Members'),
          const SizedBox(
            height: 10,
          ),
          const AddMembers(),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Create',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ))
        ],
      ),
    );
  }
}
