import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =
FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

Future<void> init() async {
  await notificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await notificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestPermission().then((value) {
        if (value != null && value) {
          print("УРААААААААААААА РАЗРЕШИЛИ УВЕДОМЛЕНИЯ");
        } else {
          print("ЗАРПЕТИЛИ УВЕДОМЛЕНИЯ (((((((");
        }
  });
}