import 'package:whatsapp_clone/utils/api_response.dart';

class ApiTokenResponse extends ApiResponse {
  String status;
  String message;
  String token;

  ApiTokenResponse({
    required this.status,
    required this.message,
    required this.token,
  });

  factory ApiTokenResponse.fromJson(Map<String, dynamic> json) =>
      ApiTokenResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
      };
}
