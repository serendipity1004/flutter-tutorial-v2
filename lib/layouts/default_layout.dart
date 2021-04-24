import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  final Widget body;
  final String? title;
  final FloatingActionButton? floatingActionButton;

  DefaultLayout({
    required this.body,
    this.title,
    this.floatingActionButton,
  });

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      appBar: AppBar(
        title: Text(
          widget.title == null ? '코드팩토리' : widget.title!,
        ),
      ),
      body: SafeArea(
        child: widget.body,
      ),
    );
  }
}
