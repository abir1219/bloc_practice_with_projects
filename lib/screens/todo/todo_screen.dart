import 'package:bloc_practice/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ToDo"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state.todoList.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      title: Text(
                        state.todoList[index],
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(DeleteTodoEvent(position: index));
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 24,
                        ),
                      ),
                    );
                  },
                  itemCount: state.todoList.length,
                )
              : const Center(
                  child: Text("No Records found"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * .5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: text,
                        decoration: const InputDecoration(
                            hintText: "Enter your todo",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            context.read<TodoBloc>().add(
                                  AddTodoEvent(todo: text.text.toString()),
                                );
                            text.text = "";
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }
}
