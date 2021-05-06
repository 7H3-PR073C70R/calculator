import 'package:sqflite/sqflite.dart';

class SaveHistory {
  List<Map<String, dynamic>> history = [];
  getDbPath() async {
    try {
      String databasesPath = await getDatabasesPath();
      String path = '${databasesPath}ultimateCal.db';
      return path;
    } catch (e) {
      print('eror504');
    }
  }

  createDb() async {
    String path = await getDbPath();
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE History (id TEXT PRIMARY KEY, operation TEXT, answer TEXT)');
    });
    return database;
  }

  void insertData(String operation, String answer) async {
    Database database = await createDb();

    try {
      database.insert('History', {
        'id': DateTime.now().toIso8601String(),
        'operation': operation,
        'answer': answer
      });
    } catch (e) {
      print('error404');
    }
  }

  getData() async {
    try {
      Database database = await createDb();
      database.query('History').then((value) {
        history.addAll(value);
        
      });
      
    } catch (e) {}
  }

  List<Map<String, dynamic>> get userHistory {
    getData();
    return history;
  }

  clearDb() async {
    Database database = await createDb();
    database.delete('History');
  }
}
