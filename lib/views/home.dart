import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/home_cubit.dart';
import 'package:todo/entity/todo.dart';
import 'package:todo/views/details.dart';
import 'package:todo/views/register.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
        onChanged: (result){
          context.read<HomeCubit>().find(result);
        },)
            :const Text("Yapılacaklar"),
        actions: [
          isSearch?
              IconButton(onPressed: (){
                setState(() {
                  isSearch = false;
                });
                context.read<HomeCubit>().getToDoList();
              }, icon: const Icon(Icons.clear)):
              IconButton(onPressed: (){
                setState(() {
                  isSearch = true;
                });
              }, icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomeCubit,List<ToDo>>(
        builder: (context,ToDoList){
          if(ToDoList.isNotEmpty){
            return ListView.builder(
                 itemCount:ToDoList.length ,
                itemBuilder: (context,index){
                   var todo = ToDoList[index];
                   return GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetails(todo: todo)))
                           .then((_) {context.read<HomeCubit>().getToDoList();});

                     },
                     child: Card(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child:Row(
                           children: [
                             Text(todo.yapilacak_is),
                             const Spacer(),
                             IconButton(onPressed: (){
                               ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                     content: Text("${todo.yapilacak_is} silinsin mi ?"),
                                   action: SnackBarAction(
                                     label: "Evet",
                                     onPressed: (){ context.read<HomeCubit>().delete(todo.yapilacak_id); },
                                   ),
                                 )
                               );

                             }, icon: const Icon(Icons.delete))
                           ],
                       ),
                       ),
                     ),
                   );
                },

            );
          }else { return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoRegister()))
              .then((_) {context.read<HomeCubit>().getToDoList();} );
        },
      ),
    );
  }
}
