import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.title});

  final String title;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final _forms = [
      WillPopScope(
          onWillPop: () => Future.sync(onWillPop), child: const Stage1Name())
    ];

    return Scaffold(
        body: Column(children: [
      PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _forms[index];
        },
      ),
    ]));
  }

  void _toNextForm() {
    _pageController.nextPage(
        duration: const Duration(microseconds: 300), curve: Curves.linear);
  }

  bool onWillPop() {
    if (_pageController.page?.round() == _pageController.initialPage) {
      return true;
    }

    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    return false;
  }
}

//Carousel Items
class Stage1Name extends StatelessWidget {
  const Stage1Name({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Имя'),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Фамилия'),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Отчество'),
        )
      ],
    ));
  }
}

class Stage2Contacts extends StatelessWidget {
  const Stage2Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: 'Phone'),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'SocialLink'),
        )
      ],
    ));
  }
}
