// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final String name;
  final List<String> cities;
  final String image;
  Country({
    required this.name,
    required this.cities,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cities': cities,
      'image': image,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] as String,
      cities: (map['cities'] as List).map((city) => city as String).toList(),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  Country copyWith({
    String? name,
    List<String>? cities,
    String? image,
  }) {
    return Country(
      name: name ?? this.name,
      cities: cities ?? this.cities,
      image: image ?? this.image,
    );
  }
}
