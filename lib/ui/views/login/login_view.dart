// lib/ui/views/login_view.dart

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/ui/common/label_input/label_input_view.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                LabelInputView(
                  hintText: 'Enter Your Email Here ...',
                  label: 'Email',
                  onChangeFunc: model.setEmail,
                  isEmptyErr: model.emailError,
                ),
                const SizedBox(height: 20),
                LabelInputView(
                  hintText: 'Enter Your Password Here ...',
                  label: 'Password',
                  onChangeFunc: model.setPassword,
                  isRequired: true,
                  isEmptyErr: model.passwordError,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    bool success = await model.login();
                    if (success) {
                      // Navigate to next screen upon successful login
                    } else {
                      // Show error message or handle invalid credentials
                    }
                  },
                  child: const Text('Login'),
                ),
                Text(model.email),
                Text(model.password)
              ],
            )),
        backgroundColor: Color(0xFF2A2843),
        // ,
      ),
    );
  }
}
