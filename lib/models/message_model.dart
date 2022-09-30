import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final Timestamp timestamp;
  final String senderID;

  MessageModel({
    required this.message,
    required this.timestamp,
    required this.senderID,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'timestamp': timestamp,
      'senderID': senderID,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      timestamp: map['timestamp'],
      senderID: map['senderID'],
    );
  }
}
