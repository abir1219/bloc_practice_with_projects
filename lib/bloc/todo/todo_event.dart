part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {}

final class AddTodoEvent extends TodoEvent {
  final String? todo;

  AddTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

final class DeleteTodoEvent extends TodoEvent {
  final int? position;

  DeleteTodoEvent({required this.position});

  @override
  List<Object?> get props => [position];
}
