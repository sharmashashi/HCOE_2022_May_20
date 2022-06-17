import 'package:firstapp/screens/signup/signupVM.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final SignupViewModel viewModel = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _textField(hintText: "Email", controller: viewModel.emailController),
          _textField(
            obscured: true,
              hintText: "Password", controller: viewModel.passwordController),
          _textField(
            obscured:true,
              hintText: "Confirm Password",
              controller: viewModel.confirmPasswordController),
          _signupButton()
        ],
      ),
    );
  }

  _textField(
      {required String hintText, required TextEditingController controller, bool? obscured}) {
    final _border =
        OutlineInputBorder(borderRadius: BorderRadius.circular(100));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        obscureText:obscured ?? false,
        controller: controller,
        decoration: InputDecoration(
        
            hintText: hintText,
            focusedBorder: _border,
            border: _border,
            isDense: true),
      ),
    );
  }

  _signupButton() {
    return ElevatedButton(
        onPressed: () {
          viewModel.signup();
        },
        child: Text("Signup",
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
  }
}
