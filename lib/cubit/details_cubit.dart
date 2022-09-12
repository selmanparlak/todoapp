import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repo/tododao_repository.dart';

class ToDoDetailsCubit extends Cubit<void> {
  ToDoDetailsCubit():super(0);
  var todo_repo = ToDoDaoRepository();

  Future<void> update(int yapilacak_id,String yapilacak_is) async {
    await todo_repo.updateToDo(yapilacak_id, yapilacak_is);
  }
}