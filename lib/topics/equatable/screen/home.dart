import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final int age;

  Person({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  List<Object> get props => [this.id, this.name, this.age];
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  renderText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final person1 = Person(id: 1, name: 'Code Factory', age: 52);
    final person2 = Person(id: 1, name: 'Code Factory 2', age: 52);

    return DefaultLayout(
      body: Column(
        children: [
          renderText('person1.id == person2.id : ${person1.id == person2.id}'),
          renderText(
              'person1.name == person2.name : ${person1.name == person2.name}'),
          renderText(
              'person1.age == person2.age : ${person1.age == person2.age}'),
          renderText('person1 == person2 : ${person1 == person2}'),
        ],
      ),
    );
  }
}
