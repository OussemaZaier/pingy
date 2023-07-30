import 'package:whatsapp_clone/utils/api_response.dart';

class ApiErrorResponse extends ApiResponse {
  String status;
  String message;

  ApiErrorResponse({
    required this.status,
    required this.message,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      ApiErrorResponse(
        status: json["status"],
        message: json["message"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
