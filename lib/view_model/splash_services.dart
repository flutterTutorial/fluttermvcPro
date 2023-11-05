import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvm/model/user_model.dart';
import 'package:mvm/utils/routes/routes_name.dart';
import 'package:mvm/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (kDebugMode) {
        print("${value.token.toString()}   ++++dd");
      }
      if (value.token == null || value.token == '') {
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          print("${value.token.toString()}   ++++kkk");
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
