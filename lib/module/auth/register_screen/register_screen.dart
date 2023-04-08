import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uber_clone/module/auth/login_screen/login_screen.dart';
import 'package:uber_clone/module/auth/register_screen/widget/nav_to_login_pg.dart';

import '../../../main.dart';
import '../../common_widget/uber_logo.dart';
import '../../home_page/home_page.dart';
import '../login_screen/widget/button.dart';
import '../login_screen/widget/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  bool isPasswordSee = false;
  bool  isConfPasswordSee= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const UberLogo(),
                const SizedBox(height: 20),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontFamily: "boltS", fontSize: 16),
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        obscureText: false,
                        controller: _nameController,
                        hintText: "User Name",
                        labelText: "User Name",
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return 'Invalid Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFieldWidget(
                        obscureText: false,
                        controller: _emailController,
                        hintText: "Email",
                        labelText: "Email",
                        validator: (value) {
                          final emailRegex = RegExp(r'^\w+([._]\w+)*@\w+\.com$');
                          if (value == "" || value!.isEmpty || value.length < 5) {
                            return 'Name cannot be less than 5 letter';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFieldWidget(
                        obscureText: false,
                        controller: _phoneController,
                        hintText: "Phone",
                        labelText: "Phone",
                        validator: (value) {
                          RegExp hexNum = RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}');
                          if (value!.isEmpty) {
                            const Text('Field must not be empty');
                          } else if (hexNum.hasMatch(value) && value.length == 10) {
                          } else {
                            return 'Invalid Phone Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFieldWidget(
                        controller: _passwordController,
                        icon: IconButton(
                          icon: Icon(isPasswordSee ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                isPasswordSee = !isPasswordSee;
                              },
                            );
                          },
                        ),
                        obscureText: isPasswordSee ? false : true,
                        hintText: "Password",
                        labelText: "Password",
                        validator: (password) {
                          if (password == "" || password!.isEmpty || password.length < 6) {
                            return 'Password cannot be less than 6 letter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFieldWidget(
                        controller: _conPasswordController,
                        icon: IconButton(
                          icon: Icon(isPasswordSee ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                isConfPasswordSee = !isConfPasswordSee;
                              },
                            );
                          },
                        ),
                        obscureText: isConfPasswordSee ? false : true,
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        validator: (conPassword) {
                          if (conPassword == "" || conPassword!.isEmpty || conPassword.length < 6) {
                            return 'Password should be at least 6 letters';
                          } else if (conPassword != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Button(
                  buttonName: 'Sign Up',
                  onTap: () {
                    _formkey.currentState!.validate();
                      RegisterNewUser(context);

                  },
                ),
                const SizedBox(height: 20),
                const LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void RegisterNewUser(BuildContext context) async {
    //FirebaseUser is deprecated and User is in use instead
    final User? user =
        (await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).catchError(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('error : $error'),
          ),
        );
        throw error;
      },
    ))
            .user;
    if (user != null) {
      Map userDataMap = {
        //trim is because of avoiding extra spaces
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "phone": _phoneController.text.trim(),
      };
      usersRef.child(user.uid).set(userDataMap);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wohoo! You are Registered.'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User not Created'),
        ),
      );
    }
  }
}
