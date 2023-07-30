import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:whatsapp_clone/repository/user/user_repository.dart';
import 'package:whatsapp_clone/utils/api_error.dart';
import 'package:whatsapp_clone/utils/api_token_response.dart';
import 'package:whatsapp_clone/utils/constants.dart';
import 'package:whatsapp_clone/utils/api_response.dart';

class UserSupaBase extends UserRepository {
  @override
  Future<ApiResponse> login(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return res.session != null
          ? ApiTokenResponse(
              status: '200',
              message: 'login success',
              token: res.session!.accessToken,
            )
          : ApiTokenResponse(
              status: '400',
              message: 'login failed',
              token: '',
            );
    } on AuthException catch (error) {
      return ApiErrorResponse(status: '400', message: error.message);
    } catch (_) {
      return ApiErrorResponse(status: '400', message: unexpectedErrorMessage);
    }
  }
}
