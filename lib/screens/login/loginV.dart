import 'package:firstapp/screens/login/loginVM.dart';
import 'package:firstapp/screens/signup/signupV.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final LoginViewModel viewModel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _textField(hintText: "Email", controller: viewModel.emailController),
        _textField(
          obscured: true,
            hintText: "Password", controller: viewModel.passwordController),
        _loginButton(),
        _signupButton()
      ]),
    );
  }

  _textField(
      {required String hintText,
      required TextEditingController controller,
      bool? obscured}) {
    final _border =
        OutlineInputBorder(borderRadius: BorderRadius.circular(100));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        obscureText: obscured??false,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: _border,
            border: _border,
            isDense: true),
      ),
    );
  }

  _loginButton() {
    return ElevatedButton(
        onPressed: () {
          viewModel.login();
        },
        child: Text("Login",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }

  _signupButton() {
    final message = "Haven't an account? ";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              Get.to(Signup());
            },
            child: Text("Create Account",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)))
      ],
    );
  }

  _appBar() {
    return PreferredSize(child: Container(), preferredSize: Size.zero);
  }
}
