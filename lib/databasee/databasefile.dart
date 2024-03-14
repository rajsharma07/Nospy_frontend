import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:nospy/model/member.dart';

class DataBase {
Future<Database> initializedDB() async {
	String path = await getDatabasesPath();
	return openDatabase(
	join(path, 'planets.db'),
	version: 1,
	onCreate: (Database db, int version) async {
		await db.execute(
		"CREATE TABLE planets(id INTEGER PRIMARY KEY , name TEXT NOT NULL,age INTEGER NOT NULL,distancefromsun INTEGER NOT NULL)",
		);
	},
	);
}

// insert data
Future<int> insertPlanets(List<Member> member) async {
	int result = 0;
	final Database db = await initializedDB();
	for (var m in member) {
	result = await db.insert('planets', m.toMap(),
		conflictAlgorithm: ConflictAlgorithm.replace);
	}

	return result;
}

// retrieve data
Future<List<Member>> retrievePlanets() async {
	final Database db = await initializedDB();
	final List<Map<String, Object?>> queryResult = await db.query('planets');
	return queryResult.map((e) => Member.fromMap(e)).toList();
}

// delete user
Future<void> deletePlanet(int id) async {
	final db = await initializedDB();
	await db.delete(
	'planets',
	where: "id = ?",
	whereArgs: [id],
	);
}
}
