import 'dart:async';

import 'package:flutter_application_1/data/resume_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ResumeContext {
  //initialize or get database - called everytime to use database
  Future<Database> _initializeOrGetDB() async {
    final database =
        openDatabase(join(await getDatabasesPath(), 'resume_database.db'),
            onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE resumes (id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, surname TEXT, phone INTEGER, email TEXT, socialLink TEXT, function TEXT, salary INTEGER, employment TEXT, sheldue TEXT, city TEXT, country TEXT, birthday TEXT, family TEXT)');
    }, version: 1);

    return database;
  }

  //insert entity in database
  Future<void> insert(ResumeEntity entity) async {
    final database = await _initializeOrGetDB();
    final resumes = (await getResumes()).toList();
    entity.id = resumes.isEmpty ? 0 : resumes.last.id! + 1;
    await database.insert('resumes', entity.toMap());
  }

  //update existing entity in database
  Future<void> update(ResumeEntity entity) async {
    final database = await _initializeOrGetDB();

    await database.update('resumes', entity.toMap(),
        where: 'id = ?', whereArgs: [entity.id]);
  }

  //delete entity from database
  Future<void> delete(ResumeEntity entity) async {
    final database = await _initializeOrGetDB();

    await database.delete('resumes', where: 'id = ?', whereArgs: [entity.id]);
  }

  //delete entity from database by id
  Future<void> deleteById(int id) async {
    final database = await _initializeOrGetDB();

    await database.delete('resumes', where: 'id = ?', whereArgs: [id]);
  }

  //get full list of resumes
  Future<List<ResumeEntity>> getResumes() async {
    final database = await _initializeOrGetDB();
    final List<Map<String, dynamic>> maps = await database.query('resumes');

    return List.generate(maps.length, (i) {
      final entity = ResumeEntity(
          maps[i]['firstName'],
          maps[i]['lastName'],
          maps[i]['surname'],
          maps[i]['phone'],
          maps[i]['email'],
          maps[i]['socialLink'],
          maps[i]['function'],
          maps[i]['salary'],
          maps[i]['employment'],
          maps[i]['sheldue'],
          maps[i]['city'],
          maps[i]['country'],
          maps[i]['birthday'],
          maps[i]['family']);
      entity.id = maps[i]['id'];

      return entity;
    });
  }
}
