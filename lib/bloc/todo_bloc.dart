import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/todo.dart';
import '../repository/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await repository.fetchTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError("Failed to load todos"));
      }
    });

    on<AddTodo>((event, emit) async {
      await repository.addTodo(
        Todo(id: DateTime.now().millisecondsSinceEpoch, title: event.title),
      );
      add(LoadTodos());
    });

    on<ToggleTodo>((event, emit) async {
      await repository.toggleTodoStatus(event.id);
      add(LoadTodos());
    });

    on<DeleteTodo>((event, emit) async {
      await repository.deleteTodo(event.id);
      add(LoadTodos());
    });
  }
}
