import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class GenresLocalDb {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE genres(
        id INTEGER,
        name TEXT
      )
      """);
  }

//create database and table
  static Future<sql.Database> db() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'Genrelocaldb.db');
    return sql.openDatabase(
      path,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createGenre(int id, String name) async {
    final db = await GenresLocalDb.db();

    final data = {
      'id': id,
      'name': name,
    };
    final i = await db.insert('genres', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return i;
  }

  //gel all data

  static Future<List<Map<String, dynamic>>> getGenres() async {
    final db = await GenresLocalDb.db();
    return db.query('genres', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getGenre(int id) async {
    final db = await GenresLocalDb.db();
    return db.query('genres', where: "id = ?", whereArgs: [id], limit: 1);
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
