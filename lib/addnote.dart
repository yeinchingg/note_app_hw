import 'package:flutter/material.dart';
class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
          child: TextButton(child: Text('confirm'),onPressed: () {Navigator.pop(context);}),
        )
    );
  }
}