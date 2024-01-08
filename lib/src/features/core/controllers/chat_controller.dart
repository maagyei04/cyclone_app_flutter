import 'package:get/get.dart';
import 'package:cyclone/src/repository/chat_repository/chat_repository.dart';

class ChatController2 extends GetxController {
  final ChatRepository _chatRepository = Get.put(ChatRepository());

  late final Rx<String> chatroomId = Rx<String>(''); // Using Rx for reactive updates

  Future<void> createChatroom({required String userId}) async {
    final chatId = await _chatRepository.createChatroom(userId: userId);
    chatroomId.value = chatId ?? 'No Chatroom Id';
  }
}
