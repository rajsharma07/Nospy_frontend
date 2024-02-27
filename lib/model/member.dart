
enum Designation{Leader, Member}

class Member {
  String name;
  String id;
  String teamid;
  String profile;
  Designation dsg;
  Member(
      {required this.name,
      required this.id,
      required this.dsg,
      required this.teamid,
      required this.profile});
}
