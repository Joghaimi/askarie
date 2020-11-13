import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static DB _dataBaseHelper;
  static Database _database;
  final dataBaseName = "Qata3a.db";
  DB._createInstance();
  factory DB() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DB._createInstance();
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
    await db.execute(tableQuery);
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
  Future<List<Map<String, dynamic>>> readFromDB({@required String sqlStmt,@required args})async{
    Database db = await this.database;
    return await db.rawQuery(sqlStmt ,args);
  }
  void delete({@required String tableName ,@required String where ,@required String args})async{
    Database db =await this.database;
    await db.delete(tableName,where: where, whereArgs: [args],);
  }
  Future<void>insert({@required Map mapInfo ,@required String tableName})async{
    Database db =await this.database;
    await db.insert(tableName,mapInfo);
  }
}
