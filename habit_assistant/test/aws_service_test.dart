import 'package:flutter_test/flutter_test.dart';
import 'package:habit_assistant/services/aws_service.dart';

void main() {
  test('Fetch habits from AWS', () async {
    final habits = await AWSService.fetchHabits();
    expect(habits.length, greaterThan(0));
    expect(habits.first.name, isNotEmpty);
  });
}