import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  renderFlatButton() {
    return FlatButton(
      onPressed: () {},
      color: Colors.red,
      child: Text(
        'Flat Button',
      ),
    );
  }

  renderOutlineButton() {
    return OutlineButton(
      onPressed: () {},
      child: Text('Outline Button'),
    );
  }

  renderRaisedButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Raised Button'),
    );
  }

  renderTextButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        // 프라이머리 색상이다.
        primary: Colors.red,
        onSurface: Colors.blue,
        backgroundColor: Colors.green,
        shadowColor: Colors.orange,
        elevation: 20.0,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.all(
          16.0,
        ),
        minimumSize: Size(
          200.0,
          75.0,
        ),
        side: BorderSide(
          color: Colors.black,
          width: 2.0,
        ),
        // shape: CircleBorder(),
        alignment: Alignment.centerRight,
      ),
      child: Text(
        'Text Button',
      ),
    );
  }

  renderOutlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(),
      child: Text('Outlined Button'),
    );
  }

  renderElevatedButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.red,
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.grey;
            } else {
              return Colors.orange;
            }
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return TextStyle(
                fontSize: 16.0,
              );
            } else {
              return TextStyle(
                fontSize: 10.0,
              );
            }
          },
        ),
      ),
      child: Text('Elevated Button'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Column(
          children: [
            renderFlatButton(),
            renderOutlineButton(),
            renderRaisedButton(),
            Divider(),
            renderTextButton(),
            renderOutlinedButton(),
            renderElevatedButton(),
          ],
        ),
      ),
    );
  }
}
