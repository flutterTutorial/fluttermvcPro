import 'package:mvm/data/response/status.dart';

class AppResponse<T> {
  Status? status;
  T? data;
  String? message;

  AppResponse(this.status, this.data, this.message);

  AppResponse.loading() : status = Status.LOADING;

  AppResponse.complited() : status = Status.COMPLITED;

  AppResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
