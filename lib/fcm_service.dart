import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'utils/app_colors.dart';
import 'utils/pref_util.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'custom_notification_channel_id',
  'Notification',
  description: 'notifications from Your App Name.',
  importance: Importance.high,
);

Future<void> initializeFireBase() async {
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    } else {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  await setupFcm();

  FirebaseMessaging.instance.getToken().then((token) async {
    //debugPrint("token :  $token"); // Print the Token in Console
    await PreferenceUtils.init();
    await PreferenceUtils.setString(key: keyFCMToken, value: "$token");
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  debugPrint("firebaseMessagingBackgroundHandler call");

  if (notification == null) {
    if (message.data != null) {
      showNotification(
          hashCode: notification.hashCode,
          title: message.data["title"],
          body: message.data["body"],
          payload: json.encode(message.data),
          valueType: message.data["ValueType"]);
    }
  } else {}
}

Future onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) async {
  debugPrint(
      "FirebaseMessaging.initialize onDidReceiveBackgroundNotificationResponse");
}

Future<void> setupFcm() async {
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOs = const DarwinInitializationSettings();
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOs,
  );

  //when the app is in foreground state and you click on notification.
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      debugPrint(
          "FirebaseMessaging.initialize onDidReceiveNotificationResponse");
    },
    onDidReceiveBackgroundNotificationResponse:
        onDidReceiveBackgroundNotificationResponse,
  );

  //When the app is terminated, i.e., app is neither in foreground or background.
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    //Its compulsory to check if RemoteMessage instance is null or not.

    if (message != null) {
      // showToast("getInitialMessage ${message.data}");
      debugPrint("FirebaseMessaging FirebaseMessaging.instance");
    }
  });

  //When the app is in the background, but not terminated.
  FirebaseMessaging.onMessageOpenedApp.listen(
    (event) {
      debugPrint(
          "FirebaseMessaging FirebaseMessaging.onMessageOpenedApp event");
      // showToast("onMessageOpenedApp ${event.data}");
    },
    cancelOnError: false,
    onDone: () {
      debugPrint(
          "FirebaseMessaging FirebaseMessaging.onMessageOpenedApp onDone");
    },
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    debugPrint("onMessage messageId ${message.messageId}");
    if (notification != null && android != null) {
      debugPrint("notification notification : ${message.notification!.title}");
      debugPrint("notification notification : ${message.notification!.body}");
      if (android.imageUrl != null && android.imageUrl!.trim().isNotEmpty) {
        showNotification(
            hashCode: notification.hashCode,
            title: notification.title,
            body: notification.body,
            payload: json.encode(message.data),
            valueType: message.data["ValueType"] ?? "");
      } else {
        debugPrint("notification ${message.data}");
        showNotification(
            hashCode: notification.hashCode,
            title: notification.title,
            body: notification.body,
            payload: json.encode(message.data),
            valueType: message.data["ValueType"] ?? "");
      }
    } else {
      if (message.data != null) {
        debugPrint("notification ${message.data}");

        showNotification(
            hashCode: notification.hashCode,
            title: message.data["title"],
            body: message.data["body"],
            payload: json.encode(message.data),
            valueType: message.data["ValueType"]);
      }
    }
  });
}

void showNotification(
    {required int hashCode,
    required String? title,
    required String? valueType,
    required String? body,
    required String? payload}) {
  flutterLocalNotificationsPlugin.show(
    hashCode,
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        icon: '@mipmap/ic_launcher',
        color: AppColors.primaryColor,
        importance: Importance.max,
        priority: Priority.high,
        // largeIcon: ByteArrayAndroidBitmap.fromBase64String(largeIcon),
        // styleInformation: bigPictureStyleInformation,
      ),
    ),
    payload: payload,
    // payload: json.encode(message.data),
  );
}
