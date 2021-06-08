import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/topics/admob_banner/screen/home.dart'
    as admob_banner;
import 'package:flutter_tutorial_v2/topics/admob_interstitial_rewarded/screen/home.dart'
    as admob_interstitial_rewarded;
import 'package:flutter_tutorial_v2/topics/buttons_v2/screen/home.dart'
    as buttons_v2;
import 'package:flutter_tutorial_v2/topics/equatable/screen/home.dart'
    as equatable;
import 'package:flutter_tutorial_v2/topics/flutter_bloc/screen/home.dart'
    as flutter_bloc;
import 'package:flutter_tutorial_v2/topics/freezed/screen/home.dart' as freezed;
import 'package:flutter_tutorial_v2/topics/hive/screen/home.dart' as hive;
import 'package:flutter_tutorial_v2/topics/moor/screens/home.dart' as moor;
import 'package:flutter_tutorial_v2/topics/null_safety/screen/home.dart'
    as null_safety;

class Route {
  final String name;
  final Widget page;

  Route({
    required this.name,
    required this.page,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final routes = [
    Route(
      name: 'Null Safety',
      page: null_safety.HomeScreen(),
    ),
    Route(
      name: 'Buttons V2',
      page: buttons_v2.HomeScreen(),
    ),
    Route(
      name: 'Admob - banner',
      page: admob_banner.HomeScreen(),
    ),
    Route(
      name: 'Admob - interstitial, Rewarded',
      page: admob_interstitial_rewarded.HomeScreen(),
    ),
    Route(
      name: 'Equatable',
      page: equatable.HomeScreen(),
    ),
    Route(
      name: 'Freezed',
      page: freezed.HomeScreen(),
    ),
    Route(
      name: 'Flutter Bloc',
      page: flutter_bloc.HomeScreen(),
    ),
    Route(
      name: 'Hive',
      page: hive.HomeScreen(),
    ),
    Route(
      name: 'Moor',
      page: moor.HomeScreen(),
    ),
  ];

  renderRoute({
    required Route route,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => route.page,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              route.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  renderRoutes() {
    return ListView.separated(
      separatorBuilder: (_, index) {
        return Container(
          height: 1.0,
          color: Colors.grey[300],
        );
      },
      itemCount: routes.length,
      itemBuilder: (_, index) {
        return renderRoute(
          route: routes[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코드팩토리'),
      ),
      body: renderRoutes(),
    );
  }
}
