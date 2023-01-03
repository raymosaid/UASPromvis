import 'package:flutter/material.dart';
import 'dart:convert';

class Character{
  final String name;
  final String race;
  final String classs;

  const Character({
    this.name = '',
    this.race = '',
    this.classs = '',
  });

  // Character copy({
  //   String name,
  //   String race,
  //   String classs,
  // }) =>
  //     Chararcter(
  //       name: name ?? this.name,
  //       race: race ?? this.race,
  //       classs: classs ?? this.classs,
  //     );
  // static Character fromJson(Map<String, dynamic> json) => User(
  //   name = json['namejson'],
  //   race = json['racejson'],
  //   classs = json['classjson'];
  // );

  //Character(this.name, this.race, this.classs);

  // Character.fromJson(Map<String, dynamic> json)
  //   : name = json['namejson'],
  //     race = json['racejson'],
  //     classs = json['classjson'];

  // Map<String, dynamic> toJson() => {
  //   'namejson' : name,
  //   'racejson' : race,
  //   'classjson' : classs,
  // };
}
