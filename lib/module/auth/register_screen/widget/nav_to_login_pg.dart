
import 'package:flutter/material.dart';
import 'package:uber_clone/module/auth/login_screen/login_screen.dart';

import '../../register_screen/register_screen.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?  ',
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LogInPage(),
              ),
            );
          },
          child: const Text(
            'login here!',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              color: Colors.teal,
            ),
          ),
        )
      ],
    );
  }
}
