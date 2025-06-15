import 'package:flutter/material.dart';

Color _hexToColor(String hex) {
  final buffer = StringBuffer();
  if (hex.length == 6 || hex.length == 7) buffer.write('ff');
  buffer.write(hex.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class Tag {
  final int id;
  final String name;
  final String? colorHex;

  Tag({required this.id, required this.name, this.colorHex});

  Color? get color =>
      colorHex != null ? _hexToColor(colorHex!) : null;

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] as int,
      name: json['name'] as String,
      colorHex: json['color'] as String?,
    );
  }
}
