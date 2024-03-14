
enum Designation{Leader, Member}

class Member {
  String name;
  String id;
  String profile;
  Designation dsg;
  Member(
      {required this.name,
      required this.id,
      required this.dsg,
      required this.profile}
      );

}
