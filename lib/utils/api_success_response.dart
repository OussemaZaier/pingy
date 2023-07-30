import 'package:whatsapp_clone/utils/serializable.dart';
import 'package:whatsapp_clone/utils/api_response.dart';

class ApiSuccessResponse<T extends Serializable> extends ApiResponse {
  String status;
  String message;
  T data;
  ApiSuccessResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiSuccessResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiSuccessResponse<T>(
      status: json["status"],
      message: json["message"],
      data: create(json["data"]),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "status": this.status,
        "message": this.message,
        "data": this.data.toJson(),
      };
}
