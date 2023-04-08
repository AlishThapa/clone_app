import 'package:flutter/material.dart';
import 'package:uber_clone/module/auth/login_screen/widget/button.dart';
import 'package:uber_clone/module/auth/login_screen/widget/custom_textfield.dart';
import 'package:uber_clone/module/auth/login_screen/widget/navigation_to_reg_pg.dart';

import '../../common_widget/uber_logo.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LogInPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSee = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const UberLogo(),
                const SizedBox(height: 15),
                const Text(
                  'LogIn',
                  style: TextStyle(fontFamily: "boltS", fontSize: 26, decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 15),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        obscureText: false,
                        controller: _emailController,
                        hintText: "Email",
                        labelText: "Email",
                        validator: (value) {
                          final emailRegex = RegExp(r'^\w+([._]\w+)*@\w+\.com$');
                          if (value == "" || value!.isEmpty || value.length < 5) {
                            return 'Email cannot be empty';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFieldWidget(
                        controller: _passwordController,
                        icon: IconButton(
                          icon: Icon(isSee ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                isSee = !isSee;
                              },
                            );
                          },
                        ),
                        obscureText: isSee ? true : false,
                        hintText: "Password",
                        labelText: "Password",
                        validator: (value) {
                          if (value == "" || value!.isEmpty || value.length < 6) {
                            return 'Password cannot be less than 6 letter';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Button(
                  buttonName: 'Log In',
                  onTap: () {
                    final validate = _formkey.currentState!.validate();
                    if (validate) {
                      print('success');
                    }
                  },
                ),
                const SizedBox(height: 20),
                const RegistrationButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
