import 'package:flutter/material.dart';
import 'package:mvm/model/todo_model.dart';
import 'package:mvm/view_model/todo_view_model.dart';
import 'package:mvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TodoViewModel>(context, listen: false).getTodoData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userViewModel.removeUser();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Consumer<TodoViewModel>(builder: (context, todoData, child) {
        return todoData.loading == true
            ? const CircularProgressIndicator()
            : ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: todoData.todoData.length,
                itemBuilder: (context, index) {
                  return const Text("data");
                });
      }),
    );
  }
}
