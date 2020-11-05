import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static DB _dataBaseHelper;
  static Database _database;
  final dataBaseName = "Qata3a.db";

  DB._createInstanse();

  factory DB() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DB._createInstanse();
    }
    return _dataBaseHelper;
  }

  Future<Database> initializeDB() async {
    // initialize DB
    Directory directory =
        await getApplicationDocumentsDirectory(); // Get Directory path
    String path = directory.path + dataBaseName;
    var dataBase =
        await openDatabase(path, version: 1); // Create || open Database
    return dataBase;
  }

  Future<Database> get database async {
    // GetDatabase
    if (_database == null) {
      _database = await initializeDB();
    }
    return _database;
  }

  void createDBTable({@required String tableQuery}) async {
    Database db = await this.database;
    db.execute(tableQuery);
    // String sql = "CREATE TABLE IF NOT EXISTS $tableName(id INTEGER PRIMARY KEY, UnitName TEXT,QS TEXT, A_Ans TEXT,B_Ans TEXT,C_Ans TEXT, D_Ans TEXT,solution INTEGER)";
  }

  Future<bool> isExist({@required String tableName}) async {
    /// check if table is exist Return bool
    Database db = await this.database;
    String sql =
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'";
    var result = await db.rawQuery(sql);
    var findTable = (result.length > 0);
    if (findTable) {
      return true;
    } else {
      return false;
    }
  }
}
