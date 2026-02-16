class Task {
  final int id;
  final String title;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  String toString() => 'Task(id: $id, title: $title, isCompleted: $isCompleted)';
}
