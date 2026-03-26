import 'dart:convert';

List<Persona> personaFromJson(String str) =>
    List<Persona>.from(json.decode(str).map((x) => Persona.fromJson(x)));

class Persona {
  final int id;
  final String name;
  final String arcana;
  final int level;
  final String description;
  final String image;

  // 🧠 Stats
  final int strength;
  final int magic;
  final int endurance;
  final int agility;
  final int luck;

  // ⚔️ Affinities
  final List<String> weak;
  final List<String> resists;
  final List<String> reflects;
  final List<String> absorbs;
  final List<String> nullifies;

  Persona({
    required this.id,
    required this.name,
    required this.arcana,
    required this.level,
    required this.description,
    required this.image,
    required this.strength,
    required this.magic,
    required this.endurance,
    required this.agility,
    required this.luck,
    required this.weak,
    required this.resists,
    required this.reflects,
    required this.absorbs,
    required this.nullifies,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      id: json['id'],
      name: json['name'],
      arcana: json['arcana'],
      level: json['level'],
      description: json['description'] ?? '',
      image: json['image'] ?? '',

      // 🧠 Stats (default 0 if missing)
      strength: json['strength'] ?? 0,
      magic: json['magic'] ?? 0,
      endurance: json['endurance'] ?? 0,
      agility: json['agility'] ?? 0,
      luck: json['luck'] ?? 0,

      // ⚔️ Affinities (safe parsing)
      weak: List<String>.from(json['weak'] ?? []),
      resists: List<String>.from(json['resists'] ?? []),
      reflects: List<String>.from(json['reflects'] ?? []),
      absorbs: List<String>.from(json['absorbs'] ?? []),
      nullifies: List<String>.from(json['nullifies'] ?? []),
    );
  }
}