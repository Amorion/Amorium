import 'package:amorium/common/screens/error_screen.dart';
import 'package:amorium/screens/auth/login_screen.dart';
import 'package:amorium/screens/auth/otp_screen.dart';
import 'package:amorium/screens/auth/user_information_screen.dart';
import 'package:amorium/screens/auth/user_photos_screen.dart';
import 'package:amorium/screens/chat/chat_list_screen.dart';
import 'package:amorium/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case (LoginScreen.routeName):
      return MaterialPageRoute(builder: (ctx) => const LoginScreen());
    case (OTPScreen.routeName):
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (ctx) => OTPScreen(verificationId: verificationId),
      );
    case (UserInformationScreen.routeName):
      return MaterialPageRoute(
        builder: (ctx) => const UserInformationScreen(),
      );
    case (UserPhotosScreen.routeName):
      return MaterialPageRoute(
        builder: (ctx) => const UserPhotosScreen(),
      );
    case (ChatListScreen.routeName):
      return MaterialPageRoute(
        builder: (ctx) => const ChatListScreen(),
      );
    case (ChatScreen.routeName):
      final map = settings.arguments as Map<String, String>;
      return MaterialPageRoute(
        builder: (ctx) => ChatScreen(
          matchID: map['matchID']!,
          displayName: map['displayName']!,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(
            error: 'This page doesn\'t exist',
          ),
        ),
      );
  }
}
