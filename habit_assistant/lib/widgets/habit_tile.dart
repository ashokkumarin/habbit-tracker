import 'package:flutter/material.dart';
import 'package:habit_assistant/models/habit.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;
  final Function(bool) onToggle;

  HabitTile({required this.habit, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(habit.name),
      trailing: Checkbox(
        value: habit.isCompleted,
        onChanged: (value) => onToggle(value!),
      ),
    );
  }
}