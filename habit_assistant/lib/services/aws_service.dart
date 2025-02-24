import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:habit_assistant/models/habit.dart';

class AWSService {
  static Future<void> configureAmplify() async {
    try {
      await Amplify.addPlugins([AmplifyAPI(), AmplifyDataStore()]);
      await Amplify.configure('''
        {
          "UserAgent": "aws-amplify-cli/2.0",
          "Version": "1.0",
          "api": {
            "plugins": {
              "awsAPIPlugin": {
                "habit_assistant": {
                  "endpointType": "GraphQL",
                  "endpoint": "YOUR_APPSYNC_ENDPOINT",
                  "region": "us-east-1",
                  "authorizationType": "API_KEY",
                  "apiKey": "YOUR_API_KEY"
                }
              }
            }
          }
        }
      ''');
    } catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  static Future<List<Habit>> fetchHabits() async {
    // Mock data for now; replace with real GraphQL query
    return [
      Habit(id: '1', name: 'Morning Exercise', date: DateTime.now()),
      Habit(id: '2', name: 'Home Breakfast', date: DateTime.now()),
    ];
  }

  static Future<void> updateHabit(Habit habit) async {
    // Implement GraphQL mutation to update habit in DynamoDB
    print('Updated habit: ${habit.name} - ${habit.isCompleted}');
  }

  static Future<List<Task>> fetchTasks() async {
    // Mock data for now; replace with GraphQL query
    return [];
  }

  static Future<void> addTask(Task task) async {
    // Implement GraphQL mutation to add task to DynamoDB
    print('Added task: ${task.title}');
  }

  static Future<void> updateTask(Task task) async {
    // Implement GraphQL mutation to update task in DynamoDB
    print('Updated task: ${task.title} - ${task.isCompleted}');
  }

}