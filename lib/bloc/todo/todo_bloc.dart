import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  _addTodo(AddTodoEvent event,Emitter<TodoState> emit){
    debugPrint("Todo--->${event.todo!}");
    // state.todoList.add(event.todo!);
    todoList.add(event.todo!);
    // debugPrint("TodoList--->${state.todoList}");
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  _deleteTodo(DeleteTodoEvent event,Emitter<TodoState> emit){
    todoList.removeAt(event.position!);
    // debugPrint("TodoList--->${state.todoList}");
    emit(state.copyWith(todoList: List.from(todoList)));
  }

}
