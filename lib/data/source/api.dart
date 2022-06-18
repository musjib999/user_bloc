import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:user_bloc/model/api_response_model.dart';

Future<ApiResponseModel?> getRequest(String url) async {
  ApiResponseModel? apiResponseModel;
  try {
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      apiResponseModel = ApiResponseModel(
        statusCode: response.statusCode,
        body: jsonDecode(response.body),
      );
    } else {
      apiResponseModel = ApiResponseModel(
        statusCode: response.statusCode,
        body: jsonDecode(response.body),
      );
    }
  } on SocketException catch (e) {
    apiResponseModel = ApiResponseModel(
      statusCode: e.osError!.errorCode,
      body: e.message,
    );
  }
  return apiResponseModel;
}
