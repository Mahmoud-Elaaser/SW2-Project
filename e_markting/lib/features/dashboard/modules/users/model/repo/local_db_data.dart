
import 'package:e_markting/features/dashboard/modules/users/model/repo/parent_data.dart';
import 'package:e_markting/features/dashboard/modules/users/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepo extends ParentRepo {
  DatabaseRepo._init();

  static DatabaseRepo? _singletoneObject;
  static late Database _database;

  static Future<DatabaseRepo> get instance async {
    if (_singletoneObject == null) {
      await _initDatabase();
      _singletoneObject = DatabaseRepo._init();
    }
    return _singletoneObject!;
  }

  ///create database
  static Future<void> _initDatabase() async {
    ///get database path on the target device
    final String databasePath = await getDatabasesPath();

    ///add your database files
    final String path = databasePath + "/users.db";
    // final path = join(databasePath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
CREATE TABLE user (
id INTEGER PRIMARY KEY AUTOINCREMENT, 
name TEXT NOT NULL, 
email TEXT NOT NULL, 
pass TEXT NOT NULL, 
age INTEGER NOT NULL, 
address TEXT )
""");
  }

  @override
  Future<void> delete({required Comparable<num> id}) async {
    await _database.delete('user', where: 'id=?', whereArgs: [id]);
  }

  @override
  Future<List<UserModel>> fetch() async {
    return (await _database.query('user')).map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  Future<void> insert({required String name, required String email, required int age, required String address,required String pass}) async {
    await _database.insert('user', {'name': name, 'email': email, 'age': age, 'address': address,'pass': pass});
}
 Future<bool> isUserExists(String email, String password) async {
    // تنفيذ الاستعلام للبحث عن المستخدم باستخدام البريد الإلكتروني وكلمة المرور
    List<Map<String, dynamic>> result = await _database.query(
      'user',
      where: 'email = ? AND pass = ?',
      whereArgs: [email, password],
    );

    // إذا كان هناك نتيجة (أي عدد الصفوف > 0) يعني العثور على المستخدم
    return result.isNotEmpty;
  }
}

