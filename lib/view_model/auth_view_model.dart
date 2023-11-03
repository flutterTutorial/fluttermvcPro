import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvm/repository/auth_repository.dart';
import 'package:mvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(BuildContext context, dynamic data) async {
    _myRepo.loginApi(data).then((value) {
      Utils.showSnackbar(context, "Succefully Login");
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.showSnackbar(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

// class AuthViewModel with ChangeNotifier {
//   final AuthRepository _myRepo = AuthRepository();

//   Future<void> loginApi(BuildContext context, dynamic data) async {
//     try {
//       final value = await _myRepo.loginApi(data);
//       Utils.showSnackbar(context, "Succefully Login");
//       print(value.toString());
//     } catch (error) {
//       Utils.showSnackbar(context, error.toString());
//       if (kDebugMode) {
//         print(error);
//       }
//     }
//   }
// }
