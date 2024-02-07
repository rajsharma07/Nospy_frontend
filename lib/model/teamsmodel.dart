class Teams{
  String? name;
  String? leader;
  List<String>? member;
  String? discription;
  Teams(this.name, this.leader, this.member, this.discription);
  Teams.fromJson(Map<String, dynamic> js){
    name = js["name"] as String;
    leader = js["leader"] as String;
    member = js["member"] as List<String>;
    discription = js["discription"] as String;
  }
}