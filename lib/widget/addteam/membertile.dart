import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nospy/model/member.dart';

class MemberTile extends StatelessWidget {
  MemberTile({super.key, required this.member});
  Member member;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          CircleAvatar(
            backgroundImage: AssetImage(member.profile),
          ),
          const SizedBox(width: 30,),
          Text(member.name),
        ]),
        IconButton(onPressed: () {}, icon: Icon(Icons.remove))
      ],
    );
  }
}
