import 'package:flutter/material.dart';

class MainItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const MainItem({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      onTap: onTap,
    );
  }
}
