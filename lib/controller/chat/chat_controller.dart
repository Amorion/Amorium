import 'package:amorium/models/chat_list_item_model.dart';
import 'package:amorium/models/user_model.dart';
import 'package:amorium/repository/chat/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository,
    ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;

  ChatController(this.chatRepository, this.ref);

  Future<String> sendMessage({
    required String message,
    required String matchID,
  }) {
    return chatRepository.sendMessage(
      message: message,
      matchID: matchID,
    );
  }

  Future<String> addChat({required String recieverID}) {
    return chatRepository.addChat(recieverID: recieverID);
  }

  Stream<List<ChatListItemModel>> getChats() {
    return chatRepository.getChats();
  }

  Future<UserModel> getUserFromID(String id) {
    return chatRepository.getUserFromID(id);
  }
}
