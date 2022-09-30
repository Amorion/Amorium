class ChatListItemModel {
  final List<dynamic> members;
  final String? matchID;

  ChatListItemModel({
    required this.members,
    this.matchID,
  });

  Map<String, dynamic> toMap() {
    return {
      'members': members,
      'matchID': matchID,
    };
  }

  factory ChatListItemModel.fromMap(Map<String, dynamic> map) {
    return ChatListItemModel(
      members: map['members'],
      matchID: map['matchID'],
    );
  }
}
