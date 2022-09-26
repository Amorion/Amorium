import 'package:amorium/repository/chat/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;

  ChatController(this.chatRepository, this.ref);

  Future<String> sendMessage() {
    return chatRepository.sendMessage();
  }
}
