import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/resume_context.dart';
import 'package:flutter_application_1/data/resume_entity.dart';

class RecentPage extends StatelessWidget {
  RecentPage({super.key, required this.title});
  final String title;

  final getResumesFunction = ResumeContext().getResumes();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getResumesFunction,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final resumes = snapshot.data;
          final cards = List.generate(
              resumes!.length, (index) => ResumeCard(entity: resumes[index]));
          return ListView(
            children: cards,
          );
        } else {
          return const Center(
            child: Text("No data"),
          );
        }
      },
    );
  }
}

class ResumeCard extends StatelessWidget {
  ResumeCard({super.key, required this.entity});

  ResumeEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Card(child: Text(entity.toString())));
  }
}
