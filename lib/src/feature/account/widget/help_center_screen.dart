import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Help Center Screen'),
        ),
  );
}
