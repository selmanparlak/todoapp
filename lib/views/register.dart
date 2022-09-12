import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/register_cubit.dart';

class ToDoRegister extends StatefulWidget {
  const ToDoRegister({Key? key}) : super(key: key);

  @override
  State<ToDoRegister> createState() => _ToDoRegisterState();
}

class _ToDoRegisterState extends State<ToDoRegister> {
  var tfToDoName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak İş Kayıt"),),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfToDoName,decoration: const InputDecoration(hintText: "Yapılacak İş"),),
              ElevatedButton(onPressed: (){
                context.read<ToDoRegisterCubit>().register(tfToDoName.text);
              }, child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
