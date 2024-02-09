import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        name TEXT PRIMARY KEY NOT NULL,
        password TEXT,
        age TEXT,
        address TEXT,
        height TEXT,
        weight TEXT,
        gender TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<int> getLogin(String name, String password) async {
    final db = await SQLHelper.db();
    var res = await db.rawQuery(
        "SELECT name FROM users WHERE name = '$name' and password = '$password'");

    if (res.isNotEmpty) {
      return 1;
    } else {
      return 0;
    }
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'master.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String name, String password, String age,
      String address, String height, String weight, String gender) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'password': password,
      'age': age,
      'address': address,
      'height': height,
      'weight': weight,
      'gender': gender
    };
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it

  //
  // static Future<List<Map<String, dynamic>>> getHeight(String name) async {
  //   final db = await SQLHelper.db();
  //   //return db.query('users', where: "name = ?", whereArgs: [name], limit: 1);
  //   var res = await db.rawQuery(
  //       "SELECT height FROM users WHERE name = '$name'");
  //   return String height = res.toString();
  // }

  static Future<String> getHeight(String name) async {
    final db = await SQLHelper.db();
    //return db.query('users', where: "name = ?", whereArgs: [name], limit: 1);
    var res =
        await db.rawQuery("SELECT height FROM users WHERE name = '$name'");
    String height;
    return height = res.toString();
  }

  static Future<String> getWeight(String name) async {
    final db = await SQLHelper.db();
    //return db.query('users', where: "name = ?", whereArgs: [name], limit: 1);
    var res =
        await db.rawQuery("SELECT weight FROM users WHERE name = '$name'");
    String height;
    return height = res.toString();
  }

  static Future<String> getAge(String name) async {
    final db = await SQLHelper.db();
    //return db.query('users', where: "name = ?", whereArgs: [name], limit: 1);
    var res = await db.rawQuery("SELECT age FROM users WHERE name = '$name'");
    String height;
    return height = res.toString();
  }

  static Future<String> getGender(String name) async {
    final db = await SQLHelper.db();
    //return db.query('users', where: "name = ?", whereArgs: [name], limit: 1);
    var res =
        await db.rawQuery("SELECT gender FROM users WHERE name = '$name'");
    String height;
    return height = res.toString();
  }

  static Future<String> getAddress(String name) async {
    final db = await SQLHelper.db();
    //return db.query('users', where: "name = ?", whereArgs: [name], limit: 1);
    var res =
        await db.rawQuery("SELECT address FROM users WHERE name = '$name'");
    String height;
    return height = res.toString();
  }
}
