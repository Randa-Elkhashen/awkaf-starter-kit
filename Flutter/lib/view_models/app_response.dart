import 'package:flutter_app/enums/request_status.dart';

class AppResponse<T extends Object>{
  RequestStatus status;
  T? data;
  bool next;

  AppResponse({
    this.data,
    required this.status,
    this.next = true,
  });
}