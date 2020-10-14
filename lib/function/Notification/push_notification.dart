import 'package:firebase_messaging/firebase_messaging.dart';
// TODO uses this to show notification https://pub.dev/packages/edge_alert
class PushNotificationService{
  static final FirebaseMessaging fcm = FirebaseMessaging();
  static Future initialise()async{
    fcm.configure(
      // Called When the App in the foreground and we receive push notification
      onMessage: (Map<String,dynamic>message)async{
        print("onMessage :$message");
        },
      // Called When the App in has been closed completely and
      // its opened from the push notification directly
      onLaunch: (Map<String,dynamic>message)async{
      print("onMessage :$message");
    },
      // Called When the App in the background and
      // and its opened from the push notification directly
      onResume: (Map<String,dynamic>message)async{
        print("onMessage :$message");
      },
    );

  }
}