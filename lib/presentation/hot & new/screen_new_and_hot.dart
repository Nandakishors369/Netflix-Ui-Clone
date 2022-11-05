import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenHotAndNew extends StatelessWidget {
  const ScreenHotAndNew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Hot And New"),
        ),
      ),
    );
  }
}
