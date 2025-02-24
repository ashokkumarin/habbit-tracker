import 'package:flutter/material.dart';
import 'package:habit_assistant/models/task.dart';
import 'package:habit_assistant/services/aws_service.dart';
import 'package:habit_assistant/services/notification_service.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
    NotificationService.initialize();
  }

  Future<void> _loadTasks() async {
    final fetchedTasks = await AWSService.fetchTasks();
    setState(() {
      tasks = fetchedTasks;
    });
  }

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      final newTask = Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _taskController.text,
        date: DateTime.now(),
      );
      setState(() {
        tasks.add(newTask);
      });
      AWSService.addTask(newTask);
      _scheduleReminder(newTask);
      _taskController.clear();
    }
  }

  void _scheduleReminder(Task task) {
    NotificationService.showNotification(
      id: int.parse(task.id),
      title: 'Task Reminder',
      body: 'Don\'t forget: ${task.title}',
      scheduledDate: DateTime.now().add(Duration(minutes: 5)), // Reminder in 5 mins
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        task.isCompleted = value!;
                      });
                      AWSService.updateTask(task);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}