import 'package:get/get.dart';
import 'package:cyclone/src/repository/chat_repository/chat_repository.dart';

class ChatController extends GetxController {
  late final ChatRepository chatRepository;

  @override
  void onInit() {
    chatRepository = ChatRepository();
    super.onInit();
  }
}