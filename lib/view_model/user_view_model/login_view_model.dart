import 'package:flutter/material.dart';
import 'package:whatsapp_clone/repository/user/user_supabase.dart';
import 'package:whatsapp_clone/utils/api_response.dart';

class LoginViewModel extends ChangeNotifier {
  bool _loading = false;
  ApiResponse? _res;
  String? _error;

  bool get loading => _loading;
  ApiResponse? get res => _res;
  String? get error => _error;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setResponse(ApiResponse res) async {
    _res = res;
  }

  setError(String error) async {
    _error = error;
  }

  login(String email, String password) async {
    setLoading(true);
    final userRepository = UserSupaBase();
    var reponse = await userRepository.login(email, password);
    print(reponse.message.toString);
    if (reponse.status != '400') {
      setResponse(reponse);
    } else if (reponse.status == '400') {
      setError(reponse.message);
    }
    setLoading(false);
  }
}
