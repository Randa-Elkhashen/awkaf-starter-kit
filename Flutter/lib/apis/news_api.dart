import 'package:flutter_app/controllers/managers/request_status_controller.dart';
import 'package:flutter_app/enums/request_status.dart';
import 'package:flutter_app/view_models/app_response.dart';
import 'package:http/http.dart';

class NewsApi{
  NewsApi._();

  static Future<AppResponse<String>> getNews({
    required Uri url,
  }) async{
    try {
      Response _response = await get(url);
      return AppResponse(
        data: _response.body,
        status: RequestStatusController.convertStatusToEnum(_response.statusCode)
      );
    } catch (error) {
      return AppResponse(
        status: RequestStatus.exception,
        data: error.toString()
      );
    }
  }
}