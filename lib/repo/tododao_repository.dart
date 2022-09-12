import 'package:todo/sqlite/database_helper.dart';

import '../entity/todo.dart';

class ToDoDaoRepository {
  Future<List<ToDo>> getToDo() async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (i) {
      var row = maps[i];
      return ToDo(yapilacak_id: row["yapilacak_id"], yapilacak_is: row["yapilacak_is"]);
    });
  }
  Future<List<ToDo>> searchToDo(String findWord) async {
    var db = await DatabaseHelper.databaseAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%$findWord%'");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return ToDo(yapilacak_id: row["yapilacak_id"], yapilacak_is: row["yapilacak_is"]);
    });
  }
  Future<void> deleteToDo(int yapilacak_id) async {
    var db = await DatabaseHelper.databaseAccess();
    await db.delete("yapilacaklar",where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }
  Future<void> updateToDo(int yapilacak_id,String yapilacak_is) async{
    var db = await DatabaseHelper.databaseAccess();
    var info = Map<String,dynamic>();
    info["yapilacak_is"] = yapilacak_is;
    await db.update("yapilacaklar", info,where: "yapilacak_id = ?",whereArgs: [yapilacak_id]);
  }
  Future<void> registerToDo(String yapilacak_is) async {
    var db = await DatabaseHelper.databaseAccess();
    var info = <String,dynamic>{};
    info["yapilacak_is"] = yapilacak_is;
    await db.insert("yapilacaklar", info);
  }
}