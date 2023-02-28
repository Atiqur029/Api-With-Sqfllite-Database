import 'dart:async';

import 'package:apiwithcroudsqflite/model/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{
  

  DBHelper._private();
  final String table="someproduct";

  static final DBHelper instence=DBHelper._private();

  static Database?_database;

  
  Future<Database?> get db async{

    if(_database!=null){
      return _database;
    }

    _database= await initdatabase();
    return _database;

  }
  
  Future<Database>initdatabase() async{

    var directory=await getApplicationDocumentsDirectory();

    var path=join(directory.path,"product.db");
    var opendata=openDatabase(path,version: 1,onCreate: _onCrete);
    return opendata;



  }




  FutureOr<void> _onCrete(Database db, int version) async{
    await db.execute(
     '''
     CREATE Table $table(
      userId INTEGER PRIMARY KEY,
      id INTEGER,
      title TEXT
      


     )

     '''


    );

    
  }

  Future<int> insertdata({required Productmodel model}) async{

    Database?database=await db;

     return database!.insert(table,model.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Productmodel>?> fetchdata() async{
    Database?database=await db;
    var data=await database!.rawQuery("SELECT * FROM $table ");

    List<Productmodel>model= data.map((e) => Productmodel.fromJson(e)).toList();
    return model;


  }
}