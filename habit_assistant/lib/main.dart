import 'package:flutter/material.dart';
import 'package:habit_assistant/screens/home_screen.dart';
import 'package:habit_assistant/services/aws_service.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AWSService.configureAmplify();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Assistant',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}