import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repo/tododao_repository.dart';

import '../entity/todo.dart';

class HomeCubit extends Cubit<List<ToDo>> {
  HomeCubit():super(<ToDo>[]);
  var todo_repo = ToDoDaoRepository();
  Future<void> getToDoList() async {
    var liste = await todo_repo.getToDo();
    emit(liste);
  }
  Future<void> find(String findWord) async {
    var list = await todo_repo.searchToDo(findWord);
    emit(list);
  }
  Future<void> delete(int yapilacak_id) async {
    await todo_repo.deleteToDo(yapilacak_id);
    await getToDoList();
  }
}