// import 'dart:html';
// import 'package:notes_app/models/rowModel.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
//
// class DbHelper {
//
//   static late DbHelper? _dbHelper ;
//   late Database? _database  ;
//
//   static final String DBtableName = "Rushi's DB Table" ;
//   static final String idCol = "ID" ;
//   static final String titleCol = "Title";
//   static final String subtitleCol = " Sub Title" ;
//   static final String priorityCol = "Priority" ;
//
//
//   //making this class as singleton
//   DbHelper.createInstance() ;
//   factory DbHelper() {
//     if( _dbHelper == null ) {
//       _dbHelper = DbHelper.createInstance() ; }
//     return _dbHelper! ;
//
//   }
//
//   Future<Database?> get database async {
//     if ( _database == null ) {
//       _database = await initializeDatabase() ;
//     }
//     return _database! ;
//   }
//
//   Future<Database?> initializeDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory() ;
//     String path = directory.path+ "note.db" ;
//
//     var var1 = await openDatabase(path, version: 1 ,
//         onCreate: _zooCreateDb ) ;
//     return var1 ;
//   }
//
//   void _zooCreateDb ( Database db , int newVersion ) async {
//     await db.execute(
//       '''
//       Create Table $DBtableName (
//       $idCol INTEGER PRIMARY KEY AUTOINCREMENT,
//       $titleCol TEXT , '
//       $subtitleCol TEXT ,
//       $priorityCol INTEGER ) '
//       '''
//     ) ;
//   }
//
//
//
//   //CRUD IS STARTED HERE
//
//   Future<int>insertRow (RowModel rowModelObj ) async {
//     Database? db = await this._database ;
//
//     var result = await db!.insert(DBtableName, rowModelObj.toMapFunc());
//     return result ;
//   }
//
//
//   Future<int>updateRow (RowModel rowModelObj ) async {
//     var db = await this._database ;
//
//     var result = await db!.update(DBtableName, rowModelObj.toMapFunc(),
//         where: '$idCol = ? ' , whereArgs : [rowModelObj.id]);
//     return result ;
//   }
//
//   Future<int>deleteRow (int id ) async {
//     var db = await this._database ;
//
//     var result = await db!.rawDelete('DELETE FROM $DBtableName WHERE $idCol = rowModelObj.id');
//     return result ;
//   }
//
//   Future<List<Map<String, dynamic>>> FetchAllRows() async {
//     Database? db = await this._database ;
//
//     var result = await db!.query(DBtableName , orderBy : '$priorityCol  ASC ') ;
//     return result ;
//     }
//
//     Future<List<RowModel>>FetchAllConvRows() async {
//
//     var noteMapList = await FetchAllRows() ;
//
//     List<RowModel> rowList = [] ;
//
//     for (int i = 0 ; i<noteMapList.length ; i++ ) {
//       rowList.add ( RowModel.fromMapObject (noteMapList [i]));
//     }
//     return rowList ;
//
//     }
//
//
// }
