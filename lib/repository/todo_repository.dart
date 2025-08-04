import 'package:bloc_tutorial/models/todo.dart';

class TodoRepository {
  final List<Todo> _todos = [];

  Future<List<Todo>> fetchTodos() async {
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_todos);
  }

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  Future<void> toggleTodoStatus(int id) async {
    final index = _todos.indexWhere((t) => t.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        isCompleted: !_todos[index].isCompleted,
      );
    }
  }

  Future<void> deleteTodo(int id) async {
    _todos.removeWhere((t) => t.id == id);
  }
}
