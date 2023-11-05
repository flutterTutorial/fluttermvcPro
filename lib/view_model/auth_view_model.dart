import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvm/model/user_model.dart';
import 'package:mvm/repository/auth_repository.dart';
import 'package:mvm/utils/routes/routes_name.dart';
import 'package:mvm/utils/utils.dart';
import 'package:mvm/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  String _error = "";
  String get error => _error;

  bool _isLoading = false;
  bool get loading => _isLoading;

  setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  getError(err) {
    _error = err;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic data) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.showSnackbar(context, "Successfully Login");
      var userModel = UserModel.fromJson(value);
      UserViewModel().saveUser(userModel);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      getError(error.toString());
      Utils.flushBarErrorMessage(context, error.toString());
      // Utils.showSnackbar(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

// class AuthViewModel with ChangeNotifier {
//   final AuthRepository _myRepo = AuthRepository();
//   String _error = "";
//   String get error => _error;

//   getError(err) {
//     _error = err;
//     notifyListeners();
//   }

//   Future<void> loginApi(BuildContext context, dynamic data) async {
//     try {
//       final value = await _myRepo.loginApi(data);
//       Utils.showSnackbar(context, "Succefully Login");
//       print(value.toString());
//     } catch (error) {
//       Utils.showSnackbar(context, error.toString());
//       _error = error.toString();
//       if (kDebugMode) {
//         print("$error  ++");
//       }
//     }
//   }
// }
