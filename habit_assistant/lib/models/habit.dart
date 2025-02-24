class Habit {
  final String id;
  final String name;
  bool isCompleted;
  final DateTime date;

  Habit({
    required this.id,
    required this.name,
    this.isCompleted = false,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isCompleted': isCompleted,
        'date': date.toIso8601String(),
      };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        id: json['id'],
        name: json['name'],
        isCompleted: json['isCompleted'],
        date: DateTime.parse(json['date']),
      );
}