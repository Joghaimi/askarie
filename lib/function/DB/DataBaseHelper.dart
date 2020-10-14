import 'dart:collection';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'material.dart';
import 'package:path_provider/path_provider.dart';


class DataBaseHelper{
  static DataBaseHelper _dataBaseHelper; // define variable only
  static Database _database;
  DataBaseHelper._createInstanse(); // Named Constractor
  factory DataBaseHelper(){
    if(_dataBaseHelper == null){
      _dataBaseHelper=  DataBaseHelper._createInstanse(); // Create instant From object (initialize obj)
    }
    return _dataBaseHelper;
  }
  // initialize DB
  Future<Database>initializeDB() async{
    // Get Directory path
    Directory directory =await getApplicationDocumentsDirectory();
    String path =directory.path+'Qata3a.db';
    // Create || open Database in this path and make reference to the database
    var Qata3adatabase= await openDatabase(path,version: 1);
    return Qata3adatabase;
  }
  // GetDatabase
  Future<Database> get database async{
    if(_database == null){
      _database =await initializeDB();
    }
    return _database;
  }
  void createDBTable(String tableName) async{
     Database db =await this.database;
     String sql = "CREATE TABLE IF NOT EXISTS $tableName(id INTEGER PRIMARY KEY, UnitName TEXT,QS TEXT, A_Ans TEXT,B_Ans TEXT,C_Ans TEXT, D_Ans TEXT,solution INTEGER)";
     db.execute(sql);
  }
  //check if table is exist
   isexist(String tableName) async{
    Database db =await this.database;
    String sql = "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName'";
    var result =await db.rawQuery(sql);
    if(result.length>0){
      return true;
    }else{
      return false;
    }
  }
  // Fetch Database
  getMaterial(String TableName , {List<dynamic> whereArgs}) async {
    Database db =await this.database;
    var result =await db.query(TableName , whereArgs:whereArgs);
    return result;
  }
  Future<List<Map<String, dynamic>>> getUnitName(tableName) async {
    Database db =await this.database;
    var result = await db.query(tableName, columns: ['UnitName']);
    return result;
  }
  Future<List<Map<String, dynamic>>> getAllQS(String tableName,String untName) async{
    Database db =await this.database;
    return await db.query(tableName, where: "UnitName =?",whereArgs:[untName]);
  }
  Future<List<Map<String, dynamic>>> getRandomQS(String tableName,String untName) async{
    Database db =await this.database;
    return await db.query(tableName, where: "UnitName =? ORDER BY RANDOM() LIMIT 10",whereArgs:[untName]);
  }
  // insert Data To DataBase
  insertMaterial(String tableName ,Map material)async{
    Database db =await this.database;
    var result = await db.insert(tableName,material);
    return result;
  }
  // Links
  void createLinkTable() async{
    Database db =await this.database;
    String sql = "CREATE TABLE IF NOT EXISTS link(id INTEGER PRIMARY KEY, LinkName TEXT,LinkURL TEXT, state TEXT)";
    db.execute(sql);
  }
  Future<List<Map<String, dynamic>>> getAllLink(String state) async{
    Database db =await this.database;
    return await db.query("link", where: "state =?",whereArgs:[state]);
  }
  insertLink(Map linkInfo)async{
    Database db =await this.database;
    var result = await db.insert("link",linkInfo);
    return result;
  }
  deleteLink(linkURL)async{
    Database db =await this.database;
    await db.delete("link",where: "LinkURL = ?", whereArgs: [linkURL],);
  }


}