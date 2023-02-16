import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        poster_path TEXT,
        vote_average TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

//create database and table
  static Future<sql.Database> db() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'bookmarksdata.db');
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(String title, String? descrption,
      String? vote_average, String? poster_path) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'poster_path': poster_path,
      'vote_average': vote_average
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  //get specific item
  static Future<List<Map<String, dynamic>>> getItem(String title) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "title = ?", whereArgs: [title], limit: 1);
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<void> deleteItembytitle(String title) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "title = ?", whereArgs: [title]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}














// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class Databasehelper {
//   static const dbName = 'myDatabase.db';
//   static const dbVersion = 1;
//   static const dbTable = 'mytable';
//   static const columnTittle = 'tittle';
//   static const columnVoteAverage = 'vote_average';
//   static const columnPosterpath = 'poster_path';
//   static const columngenrelist = 'genre_list';

//   static final Databasehelper instance = Databasehelper();

//   static Database? _database;

//   Future<Database?> get database async {
//     if (_database != null) {
//       return _database;
//     } else {
//       _database = await initDb();
//       return _database;
//     }
//   }

//   Future<Database> initDb() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    // String path = join(directory.path, dbName);
//     print(path);

//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute("""
//      CREATE TABLE mytable(
//      tittle TEXT,

//   )""");
//     });
//   }

// //insert data
//   Future<int> insertRecord(Map<String, dynamic> row) async {
//     final db = await database;
//     return await db!.insert(dbTable, row);
//   }

// //read data
//   Future<List<Map<String, dynamic>>> querrydatabase() async {
//     Database? db = await instance.database;
//     return db!.query(dbTable);
//   }

//   //delate data

//   Future<int> delateRecord(int tittle) async {
//     Database? db = await instance.database;
//     return await db!
//         .delete(dbTable, where: '$columnTittle=?', whereArgs: [tittle]);
//   }
// }
