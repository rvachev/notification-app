import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  
  @override
  Widget build(BuildContext context) {
    showNotification();
    return MaterialApp(
      title: 'Notifications',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('logo');
    var ios = IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload){
    print('Payload: $payload');
  }

  showNotification() async{
    var time = new Time(19, 39, 0);
    var android = new AndroidNotificationDetails('Channel ID', 'Channel name', 'Channel Description');
    var ios = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.showDailyAtTime(0, 'Омск Транспорт', 'Your balance is:', time, platform);
  }
}
