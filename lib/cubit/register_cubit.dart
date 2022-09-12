import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repo/tododao_repository.dart';

class ToDoRegisterCubit extends Cubit<void> {
  ToDoRegisterCubit() :super(0);
  var todo_repo = ToDoDaoRepository();

  Future<void> register(String yapilacak_is) async {
    await todo_repo.registerToDo(yapilacak_is);
  }
}