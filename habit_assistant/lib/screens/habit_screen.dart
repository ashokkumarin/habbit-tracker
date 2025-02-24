import 'package:flutter/material.dart';
import 'package:habit_assistant/models/habit.dart';
import 'package:habit_assistant/services/aws_service.dart';
import 'package:habit_assistant/widgets/habit_tile.dart';

class HabitScreen extends StatefulWidget {
  @override
  _HabitScreenState createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  List<Habit> habits = [
    Habit(id: '1', name: 'Did I do my morning exercise', date: DateTime.now()),
    Habit(id: '2', name: 'Breakfast: Home-made', date: DateTime.now()),
    Habit(id: '3', name: 'Breakfast: Outside food', date: DateTime.now()),
    Habit(id: '4', name: 'Lunch: Home-made', date: DateTime.now()),
    Habit(id: '5', name: 'Lunch: Outside food', date: DateTime.now()),
    Habit(id: '6', name: 'Snacks: Healthy at home', date: DateTime.now()),
    Habit(id: '7', name: 'Snacks: Outside snack', date: DateTime.now()),
    Habit(id: '8', name: 'Dinner: Home-made', date: DateTime.now()),
    Habit(id: '9', name: 'Dinner: Outside food', date: DateTime.now()),
    Habit(id: '10', name: 'Walked 5000 steps today', date: DateTime.now()),
  ];

  @override
  void initState() {
    super.initState();
    _loadHabits();
  }

  Future<void> _loadHabits() async {
    final fetchedHabits = await AWSService.fetchHabits();
    setState(() {
      if (fetchedHabits.isNotEmpty) {
        habits = fetchedHabits;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) => HabitTile(
          habit: habits[index],
          onToggle: (value) {
            setState(() {
              habits[index].isCompleted = value;
            });
            AWSService.updateHabit(habits[index]);
          },
        ),
      ),
    );
  }
}