import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'home_page.dart';
import 'recentpage.dart';
import 'add_page.dart';
import './data/resume_context.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;

  final context = new ResumeContext();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Resume App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 69, 174, 169)),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: [
            const HomePage(title: 'Домашняя'),
            const AddPage(title: 'Новое резюме'),
            const RecentPage(title: 'Предыдующие')
          ][_selectedPageIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedPageIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedPageIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(Icons.home_outlined),
                    label: 'Главная'),
                NavigationDestination(
                    icon: Icon(Icons.add_circle_rounded),
                    selectedIcon: Icon(Icons.add_circle_outline_rounded),
                    label: 'Создать'),
                NavigationDestination(
                    icon: Icon(Icons.recent_actors),
                    selectedIcon: Icon(Icons.recent_actors_outlined),
                    label: 'Мои резюме')
              ]),
        ));
  }
}
