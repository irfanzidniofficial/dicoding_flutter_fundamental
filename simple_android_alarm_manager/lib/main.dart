import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:simple_android_alarm_manager/ui/home_page.dart';
import 'package:simple_android_alarm_manager/utils/background_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  AndroidAlarmManager.initialize;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static const title = "Simple Alarm Manager ";
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      home: HomePage(title: title),
    );
  }
}
