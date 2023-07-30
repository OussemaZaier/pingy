import 'package:whatsapp_clone/utils/api_response.dart';

abstract class UserRepository {
  Future<ApiResponse> login(String email, String password);
}
