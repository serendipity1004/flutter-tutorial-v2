import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/layouts/default_layout.dart';
import 'package:flutter_tutorial_v2/topics/freezed/model/person.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  renderText(String title, String text) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  mapWhen(Person person) {
    return person.when(
      (id, name, age, statusCode) =>
          'id: $id, name: $name, age: $age, statusCode: $statusCode',
      loading: (int? statusCode) => 'loading....',
      error: (String message, int? statusCode) => message,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final school1 = School(id: 3, name: 'Harvard');
    // final group1 = Group(id: 2, name: 'Software Engineering', school: school1);
    // final person1 = Person(id: 1, name: 'Code Factory', age: 52, group: group1);
    //
    // final personNew = person1.copyWith(
    //   group: group1.copyWith(
    //     school: school1.copyWith(
    //       name: 'Stanford',
    //     ),
    //   ),
    // );
    //
    // final personNew2 = person1.copyWith.group.school(name: 'Stanford');
    //
    // final person2 = Person(id: 1, name: 'Code Factory', age: 52, group: group1);
    //
    // final person3 =
    //     Person(id: person1.id, name: person1.name, age: 72, group: group1);
    //
    // final person4 = person1.copyWith(age: 72);

    final person =
        Person(id: 1, name: 'Code Factory', age: 52, statusCode: 200);
    final personLoading = Person.loading();
    final personError = Person.error('accessToken 이 잘못됐습니다.', statusCode: 401);

    return DefaultLayout(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            renderText('person', person.toString()),
            renderText('personLoading', personLoading.toString()),
            renderText('personError', personError.toString()),
            renderText('person.statusCode', person.statusCode.toString()),
            renderText('person.when', mapWhen(person)),
            renderText('personLoading.when', mapWhen(personLoading)),
            renderText('personLoading.error', mapWhen(personError)),

            // renderText('person1.id', person1.id.toString()),
            // renderText('person1.name', person1.name),
            // renderText('person1.age', person1.age.toString()),
            // renderText('toString()', person1.toString()),
            // // renderText('toJson()', person1.toJson().toString()),
            // renderText('==', (person1 == person2).toString()),
            // renderText('person4.toString()', person4.toString()),
            // renderText('personNew.toString()', personNew.toString()),
            // renderText('personNew2.toString()', personNew2.toString()),
          ],
        ),
      ),
    );
  }
}
