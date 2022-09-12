import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/details_cubit.dart';
import 'package:todo/entity/todo.dart';

class ToDoDetails extends StatefulWidget {
  ToDo todo;

  ToDoDetails({required this.todo});

  @override
  State<ToDoDetails> createState() => _ToDoDetailsState();
}

class _ToDoDetailsState extends State<ToDoDetails> {
   var tfTodoName = TextEditingController();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var todo = widget.todo;
    tfTodoName.text = todo.yapilacak_is;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak İş Detay "),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTodoName,decoration:   const InputDecoration(),),
              ElevatedButton(onPressed: (){
                context.read<ToDoDetailsCubit>().update(widget.todo.yapilacak_id,tfTodoName.text);
              }, child: const Text("GÜNCELLE"))
            ],

          ),
        ),
      ),
    );
  }
}
