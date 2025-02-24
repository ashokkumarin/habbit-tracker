class Task {
  final String id;
  final String title;
  bool isCompleted;
  final DateTime date;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isCompleted': isCompleted,
        'date': date.toIso8601String(),
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        isCompleted: json['isCompleted'],
        date: DateTime.parse(json['date']),
      );
}