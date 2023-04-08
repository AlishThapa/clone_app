import 'package:flutter/material.dart';

class UberLogo extends StatelessWidget {
  const UberLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/images/uber_logo.png'),
      height: 150,
      width: 150,
    );
  }
}
