import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mvm/res/component/round_button.dart';
import 'package:mvm/view/home_screen.dart';
import 'package:mvm/view_model/auth_view_model.dart';
import 'package:mvm/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailcontroller =
      TextEditingController(text: "eve.holt@reqres.in");
  TextEditingController passwordcontroller =
      TextEditingController(text: "cityslicka");
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool vis = true;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _obsecurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Text("Log In"),
              (authViewModel.error != "")
                  ? Text(
                      authViewModel.error,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox(),
              TextFormField(
                controller: emailcontroller,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email address is required!";
                  }

                  if (!EmailValidator.validate(value.trim())) {
                    return "Invalid email address";
                  }

                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    labelText: "Email Address"),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)),
                      labelText: "Password")),
              SizedBox(height: 50),
              RoundButton(
                title: "Login",
                // loading: authViewModel.loading,
                onpresed: () {
                  passwordFocus.unfocus();
                  if (!formKey.currentState!.validate()) return;
                  Map data = {
                    "email": emailcontroller.text.trim().toString(),
                    "password": passwordcontroller.text.trim().toString()
                  };
                  print('Api Hit');
                  authViewModel.loginApi(context, data);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
