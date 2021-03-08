import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  final Widget body;
  final String? title;

  DefaultLayout({
    required this.body,
    this.title,
  });

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title == null ? '코드팩토리' : widget.title!,
        ),
      ),
      body: widget.body,
    );
  }
}
