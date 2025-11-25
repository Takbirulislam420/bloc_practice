import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_with_bloc/bloc/todo/to_do_bloc.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do list"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddToDoEvent(task: 'Task:$i'));
          }
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state.todoList.isEmpty) {
              return Center(child: Text(" No List Found"));
            } else if (state.todoList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                      onPressed: (){
                        context.read<ToDoBloc>().add(RemoveToDoEvent(task: state.todoList[index]));
                      }, 
                      icon: Icon(Icons.delete))
                  );
                },
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
