import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  renderNamedParameter({
    String? val,
  }) {
    if (val == null) {
      return Container();
    }

    return Text(val);
  }

  renderPositionalParameter(String? val) {
    if (val == null) {
      return Container();
    }

    return Text(val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Null Safety',
        ),
      ),
      body: Column(
        children: [
          renderPositionalParameter(
            'Positional Parameter',
          ),
          renderNamedParameter(),
        ],
      ),
    );
  }
}
