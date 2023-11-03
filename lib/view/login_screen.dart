import 'package:flutter/material.dart';
import 'package:mvm/res/component/round_button.dart';
import 'package:mvm/utils/utils.dart';
import 'package:mvm/view_model/auth_view_model.dart';
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
      body: Column(children: [
        TextFormField(
          controller: emailcontroller,
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocus,
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter Email",
            prefix: Icon(Icons.email),
          ),
          onFieldSubmitted: (value) {
            Utils.filedFocusChange(context, emailFocus, passwordFocus);
          },
        ),
        ValueListenableBuilder(
          valueListenable: _obsecurePassword,
          builder: (context, value, child) {
            return TextFormField(
              controller: passwordcontroller,
              obscureText: _obsecurePassword.value,
              focusNode: passwordFocus,
              obscuringCharacter: "*",
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obsecurePassword.value = !_obsecurePassword.value;
                    },
                    child: Icon(_obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                  )),
            );
          },
        ),
        RoundButton(
          title: "Login",
          onpresed: () {
            passwordFocus.unfocus();
            if (emailcontroller.text.isEmpty) {
              // Utils.showSnackbar(context, 'Please Enter Email');
              Utils.flushBarErrorMessage("Please Enter Email", context);
            } else if (passwordcontroller.text.isEmpty) {
              Utils.showSnackbar(context, 'Please Enter Password');
            } else if (passwordcontroller.text.length < 6) {
              Utils.showSnackbar(context, 'Please Enter 6 Digit Password');
            } else {
              Map data = {
                "email": emailcontroller.text.trim().toString(),
                "password": passwordcontroller.text.trim().toString()
              };

              authViewModel.loginApi(context, data);
              print('Api Hit');
            }
          },
        ),
      ]),
    );
  }
}
