import 'package:mvm/data/network/base_api_services.dart';
import 'package:mvm/data/network/network_services_api.dart';
import 'package:mvm/res/component/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.baseUrl + AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
