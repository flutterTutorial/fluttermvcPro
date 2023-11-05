import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvm/model/todo_model.dart';
import 'package:mvm/repository/todo_repository.dart';
import 'package:mvm/utils/utils.dart';

class TodoViewModel with ChangeNotifier {
  final _myRepo = TodoRepository();

  List<TodoModel> _todoData = [];
  List<TodoModel> get todoData => _todoData;
  String _error = "";
  String get error => _error;

  bool _isLoading = false;
  bool get loading => _isLoading;

  // getListData(List<TodoModel> data) {
  //   _todoData = data;
  //   notifyListeners();
  // }

  // setLoading(value) {
  //   _isLoading = value;
  //   notifyListeners();
  // }

  // getError(err) {
  //   _error = err;
  //   notifyListeners();
  // }

  getTodoData(context) async {
    _isLoading = true;
    await _myRepo.getTodoData().then((value) {
      Utils.flushBarErrorMessage(context, "Data fetch Successfully");
      List<dynamic> dynamicList = value;
      _todoData = dynamicList.map((json) => TodoModel.fromJson(json)).toList();
      _isLoading = false;
      notifyListeners();
      if (kDebugMode) {
        print(_todoData[0].id);
      }
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(context, error.toString());
      _error = error.toString();
      notifyListeners();
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
