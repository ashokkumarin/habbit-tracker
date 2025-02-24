import 'package:flutter/material.dart';
import 'package:habit_assistant/screens/habit_screen.dart';
import 'package:habit_assistant/screens/task_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Habit Assistant')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HabitScreen())),
            child: Text('Track Habits'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TaskScreen())),
            child: Text('Manage Tasks'),
          ),
        ],
      ),
    );
  }
}