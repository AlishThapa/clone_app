import 'package:flutter/material.dart';

import '../../register_screen/register_screen.dart';

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?  ',
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ),
            );
          },
          child: const Text(
            'Register here!',
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
