class Todo {
  final int id;
  final String title;
  bool isCompleted;

  Todo({required this.id, required this.title, this.isCompleted = false});

  Todo copyWith({bool? isCompleted}) {
    return Todo(
      id: id,
      title: title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
