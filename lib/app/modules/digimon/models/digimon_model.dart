// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DigimonModel {
  String? name;
  String? img;
  String? level;
  DigimonModel({
    this.name,
    this.img,
    this.level,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'level': level,
    };
  }

  factory DigimonModel.fromMap(Map<String, dynamic> map) {
    return DigimonModel(
      name: map['name'] != null ? map['name'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
      level: map['level'] != null ? map['level'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DigimonModel.fromJson(String source) =>
      DigimonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
