import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/todo_repository.dart';
import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'screens/home_screen.dart';

void main() {
  final repository = TodoRepository();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final TodoRepository repository;

  MyApp({required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TodoBloc(repository)..add(LoadTodos()),
        child: HomeScreen(),
      ),
    );
  }
}
