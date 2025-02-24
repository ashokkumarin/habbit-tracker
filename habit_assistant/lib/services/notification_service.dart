import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('channel_id', 'Habit Assistant',
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.schedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
    );
  }
}