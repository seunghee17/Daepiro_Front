
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SettingFCM {
  final _localNotifications = FlutterLocalNotificationsPlugin();

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print('Background message received: ${message.notification?.title}');
  }

  Future<void> initNotification() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _localNotifications.initialize(settings);

    const androidChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    final androidImplementation = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation != null) {
      await androidImplementation.createNotificationChannel(androidChannel);
    }

    // Foreground 알림 설정
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Foreground 메시지 처리
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      Map<String, dynamic> notification = message.data;

      if (notification != null) {
        _localNotifications.show(
          notification.hashCode,
          notification['title'],
          notification['body'],
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              importance: Importance.max,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher',
            ),
            iOS: DarwinNotificationDetails(sound: 'default'),
          ),
        );
      }
    });
  }
}