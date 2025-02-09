import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_notification/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();

    // Initialize notifications and handle FCM
    notificationServices.initLocalNotification(context);
    notificationServices.requestNotification();
    notificationServices.firebaseInit(context);
    notificationServices.isTokenRefresh();

    // Log device token
    notificationServices.getDeviceToken().then((value) {
      log('Device Token: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: const Text('Notification Setup Complete'),
      ),
    );
  }
}
