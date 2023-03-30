import 'package:flutter/material.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key, required this.title});

  final String title;

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('RecentPage')],
        ),
      ),
    );
  }
}
