import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/animated_container_page.dart';
import 'pages/animated_opacity_page.dart';
import 'pages/tween_animation_builder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Animations Playground')),
        body: const AnimationExamplesList(),
      ),
    );
  }
}

class AnimationExamplesList extends StatelessWidget {
  const AnimationExamplesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListItem(
          title: 'AnimatedContainer',
          page: AnimatedContainerPage(),
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
            settings: RouteSettings(arguments: title),
          ),
        );
      },
    );
  }
}
